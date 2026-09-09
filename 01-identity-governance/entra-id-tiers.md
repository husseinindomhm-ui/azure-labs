# Reference Matrix: Microsoft Entra ID Plan Comparison

This matrix serves as a core architectural reference for the **AZ-104 (Azure Administrator)** exam domains, outlining the distinct operational capabilities and minimum license tier requirements across the identity management landscape.

| Feature Category | 🟢 Free | 🔵 Microsoft Entra ID P1 | 🟣 Microsoft Entra ID P2 | 🌟 Microsoft Entra Suite |
| :--- | :--- | :--- | :--- | :--- |
| **Primary Focus** | Baseline cloud identity for all users. | Advanced governance and corporate security. | Premium security, automated risk, and strict identity control. | Full-stack modern security engine (SSE, ZTNA, Verified ID). |
| **Identity Protection** | Basic Multi-Factor Authentication (MFA). | **Standard Conditional Access** (Group, location, device rules). | **Risk-based Conditional Access** (Real-time user/sign-in risk intelligence). | Risk-based security + Extended secure private access gateways. |
| **Governance & Access** | Basic single sign-on (SSO) to apps. | Automated user provisioning to external SaaS apps. | **Privileged Identity Management (PIM)** for just-in-time administrative access. | Multi-cloud governance + Decentralized identity controls. |
| **Ideal Use Case** | Small setups utilizing out-of-the-box Microsoft features. | Mid-market businesses requiring customized security access policies. | Enterprises needing advanced audit trails, zero-trust setups, and PIM. | Large organizations moving fully into cloud-edge network architectures. |

---

## 💡 The AZ-104 "Mental Shortcut"
When evaluating scenarios on the exam, use these explicit architectural triggers:
* **Free** = *SSO & Basic MFA*
* **P1** = *Standard Conditional Access & SaaS Provisioning* 
* **P2** = *Privileged Identity Management (PIM) & Risk Analytics*
* **Suite** = *Network Edge, Secure Service Edge (SSE) & Advanced Cloud Security*
