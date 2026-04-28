"""
Loan financial calculation and schedule generation services.
"""
from decimal import Decimal, ROUND_HALF_UP
from datetime import date, timedelta
from dateutil.relativedelta import relativedelta

from .models import Loan, RepaymentSchedule, LoanApplication


def _round(value: Decimal) -> Decimal:
    return value.quantize(Decimal('0.01'), rounding=ROUND_HALF_UP)


def _next_due_date(start: date, period_index: int, frequency: str) -> date:
    if frequency == 'weekly':
        return start + timedelta(weeks=period_index)
    elif frequency == 'biweekly':
        return start + timedelta(weeks=period_index * 2)
    else:  # monthly
        return start + relativedelta(months=period_index)


def calculate_flat_rate(principal: Decimal, annual_rate: Decimal, term: int, periods_per_year: int):
    """
    Returns (interest_total, installment_amount, schedule_entries).
    schedule_entries: list of (principal_per_period, interest_per_period).
    """
    rate_per_period = annual_rate / Decimal('100') / Decimal(str(periods_per_year))
    total_interest = _round(principal * rate_per_period * Decimal(str(term)))
    total_repayable = principal + total_interest

    principal_per_period = _round(principal / Decimal(str(term)))
    interest_per_period = _round(total_interest / Decimal(str(term)))

    entries = []
    principal_remaining = principal
    interest_remaining = total_interest

    for i in range(term):
        if i == term - 1:
            p = _round(principal_remaining)
            ins = _round(interest_remaining)
        else:
            p = principal_per_period
            ins = interest_per_period
        entries.append((p, ins))
        principal_remaining -= p
        interest_remaining -= ins

    return total_interest, total_repayable, entries


def calculate_reducing_balance(principal: Decimal, annual_rate: Decimal, term: int, periods_per_year: int):
    """
    Returns (interest_total, installment_amount, schedule_entries).
    """
    rate = annual_rate / Decimal('100') / Decimal(str(periods_per_year))

    if rate == 0:
        installment = _round(principal / Decimal(str(term)))
        entries = []
        balance = principal
        for i in range(term):
            p = installment if i < term - 1 else _round(balance)
            entries.append((p, Decimal('0')))
            balance -= p
        return Decimal('0'), principal, entries

    # EMI formula: P * r * (1+r)^n / ((1+r)^n - 1)
    one_plus_r_n = (1 + float(rate)) ** term
    emi = float(principal) * float(rate) * one_plus_r_n / (one_plus_r_n - 1)
    emi = _round(Decimal(str(emi)))

    entries = []
    balance = principal
    total_interest = Decimal('0')

    for i in range(term):
        interest = _round(balance * rate)
        p = emi - interest
        if i == term - 1:
            p = _round(balance)
            interest = _round(emi - p)
        entries.append((p, interest))
        balance -= p
        total_interest += interest

    total_repayable = principal + total_interest
    return _round(total_interest), _round(total_repayable), entries


def disburse_loan(application: LoanApplication, disbursed_by, disbursement_date: date = None) -> Loan:
    """
    Creates a Loan and its full RepaymentSchedule from an approved LoanApplication.
    """
    if disbursement_date is None:
        disbursement_date = date.today()

    product = application.loan_product
    principal = application.amount_requested
    term = application.term
    ppy = product.periods_per_year()
    freq = product.repayment_frequency

    processing_fee = _round(principal * product.processing_fee_rate / Decimal('100'))

    if product.interest_type == 'flat':
        total_interest, total_repayable, schedule_entries = calculate_flat_rate(
            principal, product.interest_rate, term, ppy
        )
    else:
        total_interest, total_repayable, schedule_entries = calculate_reducing_balance(
            principal, product.interest_rate, term, ppy
        )

    maturity_date = _next_due_date(disbursement_date, term, freq)

    loan = Loan.objects.create(
        application=application,
        client=application.client,
        group=application.group,
        loan_product=product,
        loan_number=Loan.generate_loan_number(),
        principal_amount=principal,
        interest_amount=total_interest,
        processing_fee=processing_fee,
        total_amount=total_repayable,
        outstanding_balance=total_repayable,
        disbursement_date=disbursement_date,
        maturity_date=maturity_date,
        disbursed_by=disbursed_by,
    )

    schedule_objs = []
    for i, (p_due, i_due) in enumerate(schedule_entries, start=1):
        due_date = _next_due_date(disbursement_date, i, freq)
        schedule_objs.append(RepaymentSchedule(
            loan=loan,
            installment_number=i,
            due_date=due_date,
            principal_due=p_due,
            interest_due=i_due,
            total_due=_round(p_due + i_due),
        ))
    RepaymentSchedule.objects.bulk_create(schedule_objs)

    application.status = 'disbursed'
    application.save(update_fields=['status', 'updated_at'])

    return loan


def apply_repayment(loan: Loan, amount: Decimal, payment_date: date):
    """
    Allocates a repayment amount across pending schedule installments (oldest first,
    interest before principal). Returns (principal_component, interest_component).
    """
    remaining = amount
    total_principal = Decimal('0')
    total_interest = Decimal('0')

    pending = loan.schedule.filter(
        status__in=['pending', 'partial', 'overdue']
    ).order_by('installment_number')

    for installment in pending:
        if remaining <= 0:
            break

        interest_unpaid = installment.interest_due - installment.interest_paid
        principal_unpaid = installment.principal_due - installment.principal_paid

        # Pay interest first
        interest_payment = min(remaining, interest_unpaid)
        remaining -= interest_payment
        installment.interest_paid += interest_payment
        total_interest += interest_payment

        # Then principal
        principal_payment = min(remaining, principal_unpaid)
        remaining -= principal_payment
        installment.principal_paid += principal_payment
        total_principal += principal_payment

        installment.total_paid = installment.interest_paid + installment.principal_paid
        total_due = installment.interest_due + installment.principal_due

        if installment.total_paid >= total_due:
            installment.status = 'paid'
        elif installment.total_paid > 0:
            installment.status = 'partial'

        installment.save(update_fields=[
            'interest_paid', 'principal_paid', 'total_paid', 'status', 'updated_at'
        ])

    loan.amount_paid = _round(loan.amount_paid + amount - remaining)
    loan.outstanding_balance = _round(loan.total_amount - loan.amount_paid)

    if loan.outstanding_balance <= 0:
        loan.outstanding_balance = Decimal('0')
        loan.status = 'completed'

    loan.version += 1
    loan.save(update_fields=['amount_paid', 'outstanding_balance', 'status', 'version', 'updated_at'])

    return _round(total_principal), _round(total_interest)


def update_overdue_installments():
    """Mark installments past their due date as overdue."""
    today = date.today()
    RepaymentSchedule.objects.filter(
        due_date__lt=today,
        status='pending',
    ).update(status='overdue')
