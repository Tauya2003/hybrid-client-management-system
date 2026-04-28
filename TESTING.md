# System Testing Workflows

This document covers end-to-end test workflows for the Hybrid Client Management System.
Run them in order — each workflow builds on the previous one.

---

## Prerequisites: Starting the System

### 1. Backend (Django)
```bash
cd backend
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver 0.0.0.0:8000
```

### 2. Dashboard (Next.js)
```bash
cd dashboard
npm install
npm run dev
# Open http://localhost:3000
```

### 3. Mobile (Flutter)
```bash
cd mobile
flutter pub get
flutter run
```

> **Important for Android Emulator:** The emulator and your host machine must share a network.
> The backend URL in the mobile app should point to `http://10.0.2.2:8000` (Android emulator host alias),
> not `localhost`.

---

## Workflow 1 — Admin Setup (Dashboard)

**Purpose:** Create the foundation data that all other workflows depend on.

### 1.1 Create a Superuser (Terminal)
```bash
cd backend
python manage.py createsuperuser
# username: admin  |  password: admin123  |  email: admin@test.com
```

### 1.2 Log In to the Dashboard
1. Open `http://localhost:3000`
2. Log in with the admin credentials above
3. Confirm you land on the main dashboard with portfolio metrics (all zeros at this stage)

### 1.3 Create a Branch
1. Navigate to **Branches** in the sidebar
2. Click **New Branch**
3. Fill in:
   - Name: `Main Branch`
   - Code: `MB001`
   - Address: `123 Test Street`
4. Save — confirm the branch appears in the list

### 1.4 Create a Field Officer User
1. Navigate to **Users** in the sidebar
2. Click **New User**
3. Fill in:
   - Username: `officer1`
   - Password: `officer123`
   - Full Name: `Test Officer`
   - Role: `Field Officer`
   - Branch: `Main Branch`
4. Save — confirm the user appears in the list

### 1.5 Create a Loan Product
1. Navigate to **Loan Products** in the sidebar
2. Click **New Product**
3. Fill in:
   - Name: `Standard Micro Loan`
   - Min Amount: `100`
   - Max Amount: `5000`
   - Interest Rate: `18`
   - Interest Type: `Flat`
   - Min Term: `3`
   - Max Term: `24`
   - Repayment Frequency: `Monthly`
   - Processing Fee: `2`
4. Save — confirm the product card appears

### 1.6 Create a Second Loan Product
Repeat 1.5 with:
- Name: `Emergency Loan`
- Min: `50` / Max: `500`
- Rate: `12` / Flat
- Term: `1`–`6` / Monthly

**Expected state:** 1 branch, 2 users (admin + officer1), 2 loan products.

---

## Workflow 2 — Mobile Login & First Sync

**Purpose:** Verify the mobile app can authenticate and pull reference data.

### 2.1 Log In on Mobile
1. Open the Flutter app
2. Enter credentials: `officer1` / `officer123`
3. Tap **Login**
4. Confirm: the Home screen loads showing `Test Officer` and `Main Branch`

### 2.2 Initial Sync (Pull Loan Products)
1. Tap the **sync icon** (top-right of Home screen)
2. Confirm a green toast: `Synced — pushed 0 record(s)`
3. Navigate to **New Loan Application**
4. Tap the **Loan Product** dropdown
5. Confirm both `Standard Micro Loan` and `Emergency Loan` appear

**Expected state:** Mobile has loan products loaded from the server.

---

## Workflow 3 — Register a Client on Mobile (Online)

**Purpose:** Test client registration with immediate sync.

### 3.1 Register a New Client
1. From Home, tap **Register Client** (or navigate via Clients → +)
2. Fill in:
   - First Name: `Alice`
   - Last Name: `Moyo`
   - National ID: `50-123456-A-00`
   - Phone: `+263771234567`
   - Date of Birth: `1990-05-15`
   - Gender: `Female`
   - Address: `45 Borrowers Lane`
   - Next of Kin Name: `Bob Moyo`
   - Next of Kin Phone: `+263772345678`
3. Tap **Save**
4. Confirm: a success message appears; the client appears in the Clients list with a synced status indicator

### 3.2 Verify on Dashboard
1. Open the dashboard → **Clients**
2. Search for `Alice Moyo`
3. Confirm she appears with:
   - National ID `50-123456-A-00`
   - Branch: `Main Branch`
   - Status: Active

> If she doesn't appear, tap the sync button on mobile again and refresh the dashboard.

### 3.3 View Client Profile on Dashboard
1. Click `Alice Moyo` in the clients list
2. Confirm her personal information matches what was entered
3. Confirm Loans: `No loans` and Savings: `No savings accounts`

---

## Workflow 4 — Loan Application Lifecycle

**Purpose:** Test the full application flow from mobile creation to dashboard approval and disbursement.

### 4.1 Create Loan Application on Mobile
1. From Home, tap **New Loan Application**
2. Fill in:
   - Client: search `Alice` → select `Alice Moyo`
   - Loan Product: `Standard Micro Loan`
   - Amount: `1000` (confirm it's within $100–$5000)
   - No. of Repayments: `12` (confirm it's within 3–24)
   - Purpose: `Working capital for small business`
3. Tap **Submit**
4. Confirm success toast

### 4.2 Sync and Verify on Dashboard
1. Tap the **sync button** on mobile
2. Confirm green toast: `Synced — pushed 1 record(s)`
3. On the dashboard, navigate to **Loans → Applications tab**
4. Confirm Alice Moyo's application appears:
   - Product: `Standard Micro Loan`
   - Amount: `$1,000.00`
   - Status: `draft`

### 4.3 Submit the Application
1. On the dashboard Loans → Applications tab, find Alice's application
2. Click **Submit** (blue button)
3. Confirm status changes to `submitted`

### 4.4 Approve the Application
1. Click **Approve** (green button)
2. Confirm status changes to `approved`

### 4.5 Test Rejection (with a second client)
> First register a second client on mobile: `Charles Banda`, `50-999999-B-00`, `+263773333333`.
> Create a second loan application for Charles ($200, 6 months, Emergency Loan).
> Sync. Submit on dashboard.

1. Find Charles's application in the Applications tab (status: `submitted`)
2. Click **Reject**
3. An inline reason input appears — type: `Insufficient income documentation`
4. Click **Confirm**
5. Confirm status changes to `rejected`

### 4.6 Disburse Alice's Approved Loan
1. Find Alice's approved application
2. Click **Disburse** (green button)
3. Confirm the application disappears from the applications list (status becomes `disbursed`)
4. Navigate to **Loans → Active Loans tab**
5. Confirm a new loan appears for Alice Moyo:
   - Loan number (e.g. `LN-0001`)
   - Product: `Standard Micro Loan`
   - Principal: `$1,000.00`
   - Status: `active`

### 4.7 Verify Loan on Client Profile
1. Navigate to **Clients** → click `Alice Moyo`
2. Confirm the Loans section now shows the active loan with correct principal and status

---

## Workflow 5 — Record a Repayment (Mobile)

**Purpose:** Test repayment recording on mobile and verify it syncs to the active loan.

> **Prerequisite:** Workflow 4 complete; Alice has an active loan.

### 5.1 Sync Loan Back to Mobile
1. On mobile, tap the **sync button**
2. Navigate to **Loans** (or Alice's detail) — confirm the active loan is visible

### 5.2 Record a Repayment
1. From Home, tap **Record Repayment** (or navigate Loans → select Alice's loan → Record Repayment)
2. Fill in:
   - Amount: `100`
   - Payment Date: today
   - Payment Method: `Cash`
   - Reference Number: `REC-001`
   - Notes: `First installment`
3. Tap **Save**

### 5.3 Sync and Verify
1. Tap **sync button**
2. Confirm green toast
3. On dashboard → **Loans → Active Loans**, find Alice's loan
4. Confirm **Outstanding** balance has decreased by $100 (or appropriate principal portion)
5. Click Alice's loan number to open the detail page
6. Confirm the repayment schedule shows the first installment as `paid` or `partial`

---

## Workflow 6 — Savings Account (Mobile)

**Purpose:** Test savings account creation, deposit, and withdrawal.

### 6.1 Create a Savings Account
1. On mobile, navigate to **Savings** → **New Account**
2. Fill in:
   - Client: `Alice Moyo`
   - Account Type: `regular` (or available option)
   - Opening Balance: `50`
3. Tap **Save**
4. Sync — confirm green toast

### 6.2 Record a Deposit
1. On mobile, find Alice's savings account
2. Tap **Deposit**
3. Amount: `200` / Date: today / Notes: `Weekly savings`
4. Save and sync

### 6.3 Record a Withdrawal
1. Find Alice's savings account
2. Tap **Withdraw**
3. Amount: `30` / Date: today / Notes: `Emergency withdrawal`
4. Save and sync

### 6.4 Verify on Dashboard
1. Navigate to **Clients** → Alice Moyo
2. In the Savings section, confirm:
   - Account number is present
   - Balance: `$220.00` (50 opening + 200 deposit − 30 withdrawal)
   - Status: Active

---

## Workflow 7 — Offline Mode (Core Dissertation Feature)

**Purpose:** Verify the system works completely offline and syncs correctly when reconnected.

### 7.1 Go Offline
1. On the Android emulator: **Settings → Network & Internet → Wi-Fi → turn off** (or disable airplane mode allows this test)
2. Alternatively, stop the backend server

### 7.2 Register a Client Offline
1. On mobile, tap **Register Client**
2. Fill in:
   - First Name: `Diana`
   - Last Name: `Chikwanda`
   - National ID: `50-777777-C-00`
   - Phone: `+263774444444`
   - DOB: `1985-03-22` / Gender: Female / Address: `Rural Village`
3. Tap **Save**
4. Confirm: client appears in the list with a **pending sync** indicator (not yet synced)

### 7.3 Create a Loan Application Offline
1. Tap **New Loan Application**
2. Client: `Diana Chikwanda`
3. Product: `Standard Micro Loan` (loaded from last sync — confirm it appears)
4. Amount: `500` / Repayments: `6` / Purpose: `Livestock purchase`
5. Save — confirm pending indicator

### 7.4 Record a Repayment Offline (for Alice's existing loan)
1. Navigate to Loans → Alice's loan
2. Record Repayment: $100 / Cash / today
3. Save — confirm pending indicator

### 7.5 Come Back Online and Sync
1. Re-enable Wi-Fi or restart the backend
2. Tap the **sync button**
3. Confirm green toast: `Synced — pushed 3 record(s)` (or similar count)

### 7.6 Verify Everything Synced
On the dashboard:
1. **Clients** → Search `Diana` — confirm she appears
2. **Loans → Applications** → Confirm Diana's draft application appears
3. **Loans → Active Loans** → Alice's outstanding balance decreased again

---

## Workflow 8 — Duplicate / Conflict Detection

**Purpose:** Test the server-side deduplication logic.

### 8.1 Attempt Duplicate National ID
1. On mobile, register a second client with the **same National ID** as Alice: `50-123456-A-00`
   - Name: `Alice Duplicate` / Phone: `+263779999999`
2. Save and sync
3. Confirm: the sync either succeeds (server deduplicates and returns the existing client) or returns a conflict warning — the record should **not** create a second client with the same national ID

### 8.2 Verify No Duplicate on Dashboard
1. Dashboard → Clients → search `Alice`
2. Confirm only **one** Alice Moyo appears (not a duplicate)

---

## Workflow 9 — Dashboard Portfolio Reports

**Purpose:** Verify dashboard metrics reflect real data.

### 9.1 Main Dashboard
1. Navigate to the main dashboard (`/`)
2. Verify these metrics are non-zero and correct:
   - **Active Clients:** should be at least 2 (Alice, Diana registered)
   - **Active Loans:** should show 1 (Alice's loan, count and outstanding balance)
   - **Total Savings:** should reflect Alice's savings account balance
   - **PAR 30+:** should be 0% (loan is new, no overdue installments)
3. Check the **Loan Applications Status** chart — should show counts for draft, submitted, approved, disbursed, rejected

### 9.2 PAR Indicator Spot Check
- PAR values should all be 0 since no installments are overdue yet
- If you want to test PAR, manually update a `RepaymentSchedule` due_date in Django admin to a past date and refresh the dashboard

---

## Workflow 10 — Role-Based Access Control

**Purpose:** Verify that role restrictions work on the dashboard.

### 10.1 Log In as Field Officer
1. Log out of the admin account
2. Log in as `officer1` / `officer123`
3. Confirm:
   - **Sidebar does NOT show:** Branches, Users, Loan Products (admin-only links)
   - **Sidebar shows:** Dashboard, Clients, Groups, Loans, Savings

### 10.2 Verify Read-Only Restrictions
1. Navigate to `/loan-products` directly in the browser URL bar
2. Confirm: the **New Product** button is absent (or disabled) for field officers
3. On the Loans → Applications tab, verify action buttons respect the role:
   - Field officers cannot approve/reject/disburse (those buttons require admin or branch_manager)

### 10.3 Data Scoping
1. As `officer1`, check the Clients list — should only show clients from `Main Branch`
2. Check the Loans list — should only show loans the officer created

---

## Workflow 11 — API Direct Testing (Optional / Postman)

Use these to verify backend logic independently of the UI.

```
# Login
POST http://localhost:8000/api/auth/login/
{ "username": "admin", "password": "admin123" }
→ Save the access token

# List clients
GET http://localhost:8000/api/clients/
Authorization: Bearer <token>

# Loan application lifecycle
POST http://localhost:8000/api/loan-applications/
{ "client": "<uuid>", "loan_product": "<uuid>", "amount_requested": 1000, "term": 12, "purpose": "Test" }

POST http://localhost:8000/api/loan-applications/<uuid>/submit/
POST http://localhost:8000/api/loan-applications/<uuid>/approve/
POST http://localhost:8000/api/loan-applications/<uuid>/disburse/

# Portfolio report
GET http://localhost:8000/api/reports/portfolio/
```

---

## Quick Smoke Test Checklist

Use this for a fast pass before a demo or after any code change.

- [ ] Admin can log in to dashboard
- [ ] Loan products visible on mobile after sync
- [ ] New client registered on mobile appears on dashboard after sync
- [ ] Loan application created on mobile appears in Applications tab
- [ ] Submit / Approve / Disburse buttons work on dashboard
- [ ] Active loan appears in Active Loans tab after disburse
- [ ] Client profile on dashboard shows linked loan
- [ ] Repayment recorded on mobile reduces outstanding balance on dashboard
- [ ] Offline registration queues correctly (pending indicator visible)
- [ ] Sync on reconnect clears the queue (pending → no indicator)
- [ ] Dashboard portfolio metrics are non-zero and plausible
- [ ] Field officer role cannot see Branches/Users/Loan Products in sidebar
