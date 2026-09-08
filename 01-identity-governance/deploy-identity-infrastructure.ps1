<#
.SYNOPSIS
    Automates the creation of test Entra ID users and groups for AZ-104 lab environments.
.DESCRIPTION
    This script provisions a standard IT auditing security group and populates it with 
    three distinct test users using the Microsoft.Graph PowerShell module.
#>

# 1. Enforce Module Dependency
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.Users)) {
    Write-Warning "Microsoft.Graph module not found. Please install it later using: Install-Module Microsoft.Graph"
}

# 2. Define Parameters for Flexibility
$GroupDisplayName = "grp-it-auditors"
$DomainName = "://onmicrosoft.com" # Change to your primary domain later

Write-Host "========== STARTING ENTRA ID PROVISIONING LAB ==========" -ForegroundColor Cyan

# 3. Create the Target Security Group
Write-Host "[+] Creating Security Group: $GroupDisplayName..." -ForegroundColor Yellow
# Actual AZ-104 Cmdlet that will run:
# $auditGroup = New-MgGroup -DisplayName $GroupDisplayName -MailEnabled $false -MailNickname "itauditors" -SecurityEnabled $true

# 4. Define Test User Matrix
$testUsers = @(
    @{ FirstName = "Alice"; LastName = "Smith"; JobTitle = "Lead Auditor"; UPN = "asmith" },
    @{ FirstName = "Bob";   LastName = "Jones"; JobTitle = "Risk Analyst"; UPN = "bjones" },
    @{ FirstName = "Carol"; LastName = "White"; JobTitle = "Compliance Officer"; UPN = "cwhite" }
)

# 5. Loop Through and Provision Users
foreach ($user in $testUsers) {
    $fullUPN = "$($user.UPN)@$DomainName"
    Write-Host "[+] Provisioning User Account: $fullUPN ($($user.JobTitle))" -ForegroundColor Green
    
    # Actual AZ-104 Cmdlets that will run:
    # $passwordProfile = @{ Password = "ComplexPassword123!"; ForceChangePasswordNextSignIn = $true }
    # $newAzUser = New-MgUser -DisplayName "$($user.FirstName) $($user.LastName)" -UserPrincipalName $fullUPN -AccountEnabled $true -MailNickname $user.UPN -PasswordProfile $passwordProfile
    
    # Add User to Group
    # New-MgGroupMemberByRef -GroupId $auditGroup.Id -DirectoryObjectId $newAzUser.Id
}

Write-Host "========== LAB CONFIGURATION TEMPLATE COMPLETE ==========" -ForegroundColor Cyan
