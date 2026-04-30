"""
Sync push/pull endpoints.

POST /api/sync/push/
  Accepts batched records from the device, applies them server-side,
  and returns the result of each record (created, updated, conflict, error).

GET /api/sync/pull/?since=<ISO8601>&device_id=<str>
  Returns all records changed since the given timestamp, excluding
  changes that originated from the requesting device_id (to avoid echo).
"""
import uuid
import logging
from datetime import datetime, timezone

from django.db import IntegrityError
from django.forms.models import model_to_dict
from rest_framework import status, permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response

from .models import SyncLog, ConflictRecord
from .registry import ENTITY_REGISTRY, PROTECTED_FIELDS, DEDUP_KEYS
from .conflict_resolver import resolve, _model_to_dict

logger = logging.getLogger(__name__)


def _serialize_instance(instance) -> dict:
    data = _model_to_dict(instance)
    return data


def _apply_payload_to_instance(instance, payload: dict, entity_type: str):
    protected = PROTECTED_FIELDS.get(entity_type, [])
    skip = {'id', 'created_at', 'version'} | set(protected)
    for key, value in payload.items():
        if key in skip:
            continue
        # Accept both 'branch' and 'branch_id' style keys
        if hasattr(instance, key):
            setattr(instance, key, value)
    instance.version += 1


@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def push(request):
    """
    Request body:
    {
      "device_id": "string",
      "records": [
        {
          "entity_type": "client",
          "local_id": "uuid",
          "operation": "create" | "update" | "delete",
          "payload": { ...model fields... },
          "client_updated_at": "ISO8601"
        }
      ]
    }
    """
    device_id = request.data.get('device_id', 'unknown')
    records = request.data.get('records', [])

    if not isinstance(records, list):
        return Response({'detail': 'records must be a list.'}, status=status.HTTP_400_BAD_REQUEST)

    processed = []
    conflicts = []
    errors = []

    sync_log = SyncLog.objects.create(
        device_id=device_id,
        user=request.user,
        status='success',
    )

    for record in records:
        entity_type = record.get('entity_type')
        local_id = record.get('local_id')
        operation = record.get('operation')
        payload = record.get('payload', {})

        if entity_type not in ENTITY_REGISTRY:
            errors.append({'local_id': local_id, 'error': f'Unknown entity_type: {entity_type}'})
            continue

        Model = ENTITY_REGISTRY[entity_type]

        try:
            result = _process_record(
                Model, entity_type, local_id, operation, payload, request.user, sync_log
            )
            if result['status'] == 'conflict':
                conflicts.append(result)
            else:
                processed.append(result)
        except Exception as e:
            logger.exception('Error processing sync record local_id=%s', local_id)
            errors.append({'local_id': local_id, 'error': str(e)})

    sync_log.records_pushed = len(records)
    sync_log.conflicts_detected = len(conflicts)
    sync_log.conflicts_resolved = len(conflicts)
    sync_log.status = 'success' if not errors else 'partial'
    sync_log.error_details = errors if errors else None
    sync_log.save(update_fields=[
        'records_pushed', 'conflicts_detected', 'conflicts_resolved',
        'status', 'error_details', 'updated_at',
    ])

    return Response({
        'sync_log_id': str(sync_log.id),
        'processed': processed,
        'conflicts': conflicts,
        'errors': errors,
    })


def _process_record(Model, entity_type, local_id, operation, payload, user, sync_log):
    # Normalise the id — use the local_id as the server UUID if the record is new
    record_id = payload.get('id') or local_id

    if operation == 'delete':
        try:
            instance = Model.objects.get(pk=record_id)
            instance.soft_delete()
            return {'local_id': local_id, 'server_id': str(record_id), 'status': 'deleted'}
        except Model.DoesNotExist:
            return {'local_id': local_id, 'server_id': str(record_id), 'status': 'not_found'}

    # Check if the record already exists by UUID
    existing = None
    try:
        existing = Model.objects.get(pk=record_id)
    except Model.DoesNotExist:
        pass

    # Check deduplication keys for create operations
    if existing is None and operation == 'create':
        existing = _find_by_dedup_keys(Model, entity_type, payload)

    if existing is None:
        # Create new record using the device-generated UUID
        try:
            instance = _create_instance(Model, entity_type, record_id, payload, user)
            return {
                'local_id': local_id,
                'server_id': str(instance.id),
                'status': 'created',
                'server_data': _serialize_instance(instance),
            }
        except IntegrityError as e:
            # Do not run further queries in this atomic block after an IntegrityError.
            # Let the caller capture this as a per-record sync error.
            raise e

    # Record exists — check for conflict
    resolution, winning_data = resolve(entity_type, existing, payload)

    if resolution == 'client_wins':
        _apply_payload_to_instance(existing, payload, entity_type)
        existing.save()
        ConflictRecord.objects.create(
            sync_log=sync_log,
            entity_type=entity_type,
            entity_id=existing.id,
            server_data=_serialize_instance(existing),
            client_data=payload,
            resolution='client_wins',
        )
        return {
            'local_id': local_id,
            'server_id': str(existing.id),
            'status': 'conflict',
            'resolution': 'client_wins',
            'server_data': _serialize_instance(existing),
        }
    else:
        ConflictRecord.objects.create(
            sync_log=sync_log,
            entity_type=entity_type,
            entity_id=existing.id,
            server_data=_serialize_instance(existing),
            client_data=payload,
            resolution='server_wins',
        )
        return {
            'local_id': local_id,
            'server_id': str(existing.id),
            'status': 'conflict',
            'resolution': 'server_wins',
            'server_data': _serialize_instance(existing),
        }


def _find_by_dedup_keys(Model, entity_type, payload):
    keys = DEDUP_KEYS.get(entity_type, [])
    for key in keys:
        value = payload.get(key)
        if value:
            try:
                return Model.objects.get(**{key: value})
            except Model.DoesNotExist:
                continue
    return None


def _create_instance(Model, entity_type, record_id, payload, user):
    protected = PROTECTED_FIELDS.get(entity_type, [])
    skip = {'created_at', 'updated_at'} | set(protected)

    fields = {}
    for field in Model._meta.get_fields():
        # Skip reverse relations (no attname) and abstract fields
        if not hasattr(field, 'column'):
            continue
        fname = field.name
        # FK fields: field.name='branch', field.attname='branch_id'
        attname = getattr(field, 'attname', fname)
        if fname in skip or attname in skip:
            continue
        # Prefer the _id form so FK assignment works cleanly
        if attname in payload:
            fields[attname] = payload[attname]
        elif fname in payload:
            fields[fname] = payload[fname]

    fields['id'] = record_id

    # Inject server-controlled fields
    if entity_type == 'client' and 'created_by_id' not in fields and 'created_by' not in fields:
        fields['created_by'] = user

    return Model.objects.create(**fields)


@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def pull(request):
    """
    Query params:
      since     - ISO8601 timestamp of last successful pull
      device_id - used for future echo-suppression (currently informational)
    """
    since_str = request.query_params.get('since')
    if not since_str:
        return Response(
            {'detail': 'since parameter is required (ISO8601 timestamp).'},
            status=status.HTTP_400_BAD_REQUEST,
        )

    try:
        since_str = since_str.replace('Z', '+00:00')
        since = datetime.fromisoformat(since_str)
    except ValueError:
        return Response({'detail': 'Invalid since timestamp.'}, status=status.HTTP_400_BAD_REQUEST)

    user = request.user
    pull_results = []
    now = datetime.now(tz=timezone.utc)

    for entity_type, Model in ENTITY_REGISTRY.items():
        qs = Model.objects.filter(updated_at__gt=since)

        # Scope to branch for field officers and branch managers
        if user.role in ('field_officer', 'branch_manager'):
            qs = _scope_to_branch(qs, entity_type, user)

        for instance in qs:
            pull_results.append({
                'entity_type': entity_type,
                'operation': 'delete' if instance.is_deleted else 'upsert',
                'data': _serialize_instance(instance),
            })

    SyncLog.objects.create(
        device_id=request.query_params.get('device_id', 'unknown'),
        user=user,
        records_pulled=len(pull_results),
        status='success',
    )

    return Response({
        'sync_timestamp': now.isoformat(),
        'record_count': len(pull_results),
        'records': pull_results,
    })


def _scope_to_branch(qs, entity_type, user):
    branch_filters = {
        'client': {'branch': user.branch},
        'group': {'branch': user.branch},
        'group_membership': {'group__branch': user.branch},
        'loan_application': {'client__branch': user.branch},
        'repayment': {'loan__client__branch': user.branch},
        'savings_account': {'client__branch': user.branch},
        'savings_transaction': {'savings_account__client__branch': user.branch},
    }
    f = branch_filters.get(entity_type)
    return qs.filter(**f) if f else qs
