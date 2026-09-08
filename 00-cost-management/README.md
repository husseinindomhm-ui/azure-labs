# Lab: Implementing Azure Budgets and Cost Alerts

## 📌 Project Overview & Objective
When managing an enterprise Azure environment (or a personal learning sandbox), uncontrolled cloud spend is a major operational risk. The objective of this lab is to establish a strict financial governance baseline for my **AZ-104** study environment. 

By configuring automated budget thresholds and proactive email alerts, I have created a programmatic safety net to prevent unexpected billing charges while practicing with high-cost infrastructure (like Virtual Machines and Application Gateways).

### Key Architectural Controls Implemented:
* **Absolute Spending Limit:** Verified the native Microsoft $0 hard cap on the Free Trial.
* **Proactive Budgeting:** Created a soft limit threshold at $150 USD.
* **Multi-Tier Notification Engine:** Configured automated email warnings based on both actual usage and forecasted cost burn rates.

---

## 🗺️ Governance Workflow Diagram

`	ext
[ Azure Resources Running ] 
           │
           ▼
[ Cost Management Engine ] ────► Checks Burn Rate Hourly
           │
           ├─► At 50% ($75 Actual)  ──────► [ Sends Warning Email ]
           ├─► At 80% ($120 Actual) ──────► [ Sends Warning Email ]
           └─► At 100% ($150 Forecasted) ──► [ Sends High Priority Alert ]
`

---

## 🛠️ Step-by-Step Implementation & Proof of Work

### Step 1: Verification of the Native Spending Limit
Before deploying infrastructure, I verified that Microsoft’s hard-stop policy was active on my account profile to completely mitigate credit card liability.

* **Path:** Cost Management + Billing > Subscriptions > Free Trial
* **Proof Indicator:** The platform explicitly displays a Spending Limit: Enabled status banner on the subscription overview blade.

*✨ [Insert a screenshot here showing your Azure portal with the "Spending Limit: Enabled" banner visible]*

### Step 2: Provisioning the Azure Budget Alert
I configured a custom billing budget targeted specifically at my exam prep environment to monitor monthly burn rates.

* **Budget Name:** AZ104-Exam-Prep-Budget
* **Amount:** $150.00 USD
* **Time Grain:** Monthly Reset

*✨ [Insert a screenshot here of your "Create a budget" details page before you clicked next]*

### Step 3: Setting Up Alert Conditions
To catch runaway resource spending early, I implemented three distinct automated notification triggers:

| Alert Type | Threshold (%) | Trigger Amount | Evaluation Logic |
| :--- | :--- | :--- | :--- |
| **Actual** | 50% | $75.00 | Triggers the exact moment accrued spending hits $75. |
| **Actual** | 80% | $120.00 | Triggers as a critical warning before hitting the budget cap. |
| **Forecasted** | 100% | $150.00 | **Proactive:** Triggers if Azure’s AI projects that current usage trends *will* hit $150 by the end of the month. |

*✨ [Insert a screenshot of your Alert Conditions page showing the 50%, 80%, and 100% metrics]*

---

## 🧪 Verification & Proof of Function
To verify compliance, the configuration was successfully committed to the Azure Resource Manager (ARM) engine. Below is the confirmation of the live tracking dashboard actively monitoring the environment:

*✨ [Insert a screenshot of your completed Budgets dashboard showing your new budget listed in the table with a green progress bar]*

---

## 💡 Key Takeaways & AZ-104 Lessons Learned
1. **Forecasted vs. Actual Alerts:** Relying only on *actual* alerts means you find out about overspending after it happens. *Forecasted* alerts provide an early warning system to clean up heavy resources before the billing cycle ends.
2. **The Cloud Administrator's Golden Rule:** Cost optimization is an ongoing task. Always pair budgets with automated mechanisms like VM Auto-Shutdown to maintain a lean cloud profile.
