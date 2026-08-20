# Intermediate 01: DevOps functions and modules

Build a reusable PowerShell module for logging, command checks, validation, and common DevOps helpers.

```powershell
Import-Module .\DevOpsTools.psm1 -Force
Write-DevOpsLog -Message 'Starting deployment'
Test-CommandAvailable -Name 'az'
```
