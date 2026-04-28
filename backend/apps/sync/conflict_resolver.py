"""
Conflict resolution logic for the sync engine.

Policy:
  - Financial records (repayments, savings_transaction): server_wins always.
    These are immutable once created; the server is the source of truth.
  - Profile records (client, group, group_membership, loan_application):
    last_write_wins based on updated_at timestamp.
"""
from datetime import datetime, timezone
from typing import Literal

FINANCIAL_ENTITIES = frozenset(['repayment', 'savings_transaction'])

Resolution = Literal['server_wins', 'client_wins']


def parse_ts(ts_str: str) -> datetime:
    if ts_str is None:
        return datetime.min.replace(tzinfo=timezone.utc)
    if isinstance(ts_str, datetime):
        return ts_str
    # Handle ISO 8601 with or without timezone
    ts_str = ts_str.replace('Z', '+00:00')
    return datetime.fromisoformat(ts_str)


def resolve(entity_type: str, server_obj, client_payload: dict) -> tuple[Resolution, dict]:
    """
    Determine which version wins and return (resolution, winning_data).

    server_obj: Django model instance (server's current state)
    client_payload: dict from the mobile device
    """
    if entity_type in FINANCIAL_ENTITIES:
        return 'server_wins', _model_to_dict(server_obj)

    client_ts = parse_ts(client_payload.get('updated_at'))
    server_ts = server_obj.updated_at
    if server_ts.tzinfo is None:
        from datetime import timezone as tz
        server_ts = server_ts.replace(tzinfo=tz.utc)

    if client_ts > server_ts:
        return 'client_wins', client_payload
    else:
        return 'server_wins', _model_to_dict(server_obj)


def _model_to_dict(instance) -> dict:
    from django.forms.models import model_to_dict
    data = model_to_dict(instance)
    # Ensure UUID fields are strings
    for k, v in data.items():
        import uuid
        if isinstance(v, uuid.UUID):
            data[k] = str(v)
    data['id'] = str(instance.id)
    data['updated_at'] = instance.updated_at.isoformat()
    data['created_at'] = instance.created_at.isoformat()
    data['version'] = instance.version
    data['is_deleted'] = instance.is_deleted
    return data
