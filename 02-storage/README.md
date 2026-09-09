# Storage Lab Documentation
# Lab: Declarative Infrastructure Sourcing via JSON ARM Templates

## 📌 Project Overview & Objective
As an enterprise Azure Administrator, provisioning resources manually through the graphical user interface (Azure Portal) introduces the risk of human error and configuration drift. The objective of this lab is to pivot to **Infrastructure as Code (IaC)** by authoring a reusable, multi-tiered JSON Azure Resource Manager (ARM) template paired with a dedicated parameters file.

This blueprint defines an enterprise-grade, highly secure **Azure Storage Account** structured to enforce strict compliance baselines, such as encrypted transport and localized high availability.

### Key Architectural Controls Defined:
* **Decoupled Architecture:** Separated core structural definitions (`azuredeploy.json`) from environment-specific configuration values (`azuredeploy.parameters.json`).
* **Enforced Transport Security:** Configured the `supportsHttpsTrafficOnly` protocol explicitly to true to ensure no unencrypted connections are accepted by the storage API endpoint.
* **Cost-Optimized Replication:** Set the storage engine replication layout natively to `Standard_LRS` (Locally Redundant Storage) to control sandbox burn rates.

---

## 🛠️ Template Schema & Structure Realized

The deployment model leverages the standard 4-pillar ARM design matrix:

1. **Parameters:** Exposes input fields for `storageAccountName` and deployment `location` (defaulted to `eastus`) to ensure the template remains completely modular.
2. **Variables:** Evaluates internal string mappings, locking down the SKU architecture layout without exposing unnecessary toggles to the end deployer.
3. **Resources:** Declares the provisioning instructions for the `Microsoft.Storage/storageAccounts` provider mapping to the `2023-01-01` API engine.

```json
// Structural snippet enforcing account security
"properties": {
  "supportsHttpsTrafficOnly": true,
  "encryption": {
    "services": {
      "file": { "keyType": "Account", "enabled": true },
      "blob": { "keyType": "Account", "enabled": true }
    }
  }
}
```

---

## 💻 Visual Studio Code Tooling & Verification Workflow

To maintain modern DevOps habits entirely offline while awaiting card activation, the engineering environment was explicitly migrated to Microsoft's next-generation **Azure Resources** and **Bicep** extension ecosystem inside Visual Studio Code on Ubuntu.

### Validation Matrix Performed:
* **Syntax Tokenization:** The Bicep language server dynamically parsed the raw JSON strings to perform compile-time linting checks.
* **Parameters Association:** Linked the variable inputs file to the base schema mapping, enabling live type-checking verification within the IDE framework.

---

## 🚀 Execution Strategy (Post-Activation Blueprint)
When the target Azure subscription goes live, this complete architecture framework will be provisioned directly from the command shell using the following automated command pipeline:

```powershell
# Authenticate to the cloud tenant
Connect-AzAccount

# Target the subscription and trigger the deployment engine
New-AzResourceGroupDeployment `
  -ResourceGroupName "rg-az104-storage-labs" `
  -TemplateFile "./02-storage/azuredeploy.json" `
  -TemplateParameterFile "./02-storage/azuredeploy.parameters.json"
```
