# Architectural Reference: Microsoft Entra ID REST API Architecture

This documentation details how **Microsoft Entra ID** leverages the HTTP/HTTPS protocol to manage cloud identity resources programmatically via the **Microsoft Graph REST API**.

---

## 🧠 The Mechanics: REST API over HTTP/HTTPS

**REST** (Representational State Transfer) is the architectural pattern that governs communication between your local management environment (PowerShell, Azure CLI, or the Azure Portal web interface) and the cloud. Every administrative action translates to an HTTP request targeted at a specific resource endpoint.

### Core HTTP Operations (Verbs):
* **GET** $\rightarrow$ Read data (e.g., query existing user account profiles).
* **POST** $\rightarrow$ Create data (e.g., provision a new security group).
* **PATCH** $\rightarrow$ Update data (e.g., alter an account's job title property).
* **DELETE** $\rightarrow$ Remove data (e.g., purge an active user).

All communications are heavily encrypted using standard **HTTPS (port 443)**. Security authorization requires passing a cryptographically signed **OAuth 2.0 Access Token** inside the request header.

---

## 📝 Technical Case Study: Programmatic User Provisioning

When you instruct an identity engine to add a new account, the platform generates a specific structured sequence:

### 1. The Outbound HTTPS Request Header
The local client targets the unified Microsoft Graph endpoint, establishing content specifications and attaching the bearer validation token:

`http
POST https://microsoft.com
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtp... [Encrypted Token]
Content-Type: application/json
`

### 2. The Request Body Data Payload (JSON)
The core properties of the new resource are defined declaratively as key-value pairs inside a raw JSON block:

`json
{
  "accountEnabled": true,
  "displayName": "Alice Smith",
  "mailNickname": "asmith",
  "userPrincipalName": "asmith@://onmicrosoft.com",
  "passwordProfile" : {
    "forceChangePasswordNextSignIn": true,
    "password": "ComplexPassword123!"
  }
}
`

### 3. The Inbound Cloud Response
Upon successful validation, authentication, and execution, the Entra ID directory commits the resource to the database and returns an **HTTP Status Code 201 Created** along with the generated resource metadata:

`json
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d",
  "displayName": "Alice Smith",
  "userPrincipalName": "asmith@://onmicrosoft.com"
}
`

---

## 💡 Why This Matters for PowerShell (pwsh)
Native Azure cmdlets like New-MgUser or Get-MgGroup do not run standalone cloud logic. They function as **abstractions (wrappers)**. 

When you run an identity command, the Microsoft.Graph module converts your parameters into the exact JSON HTTP payloads shown above, transmits them over HTTPS, receives the response, and formats the returning JSON back into a standard PowerShell object inside your terminal shell.
