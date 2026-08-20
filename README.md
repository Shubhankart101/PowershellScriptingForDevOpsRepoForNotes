# PowerShell Scripting for DevOps Reference Notes

A practical PowerShell library for DevOps automation, cloud operations, CI/CD, observability, reporting, and incident response.

## Learning path

| Level | Focus | Start here |
| --- | --- | --- |
| Beginner | PowerShell syntax, objects, files, errors, and reusable functions | [beginner/01-basics](beginner/01-basics) |
| Intermediate | APIs, Azure CLI integration, parallel work, logging, and pipeline helpers | [intermediate/01-devops-functions](intermediate/01-devops-functions) |
| Advanced | Production-grade modules, structured logging, retries, secrets boundaries, and CI/CD | [advanced/01-production-module](advanced/01-production-module) |

## Project use cases

- [Azure resource operations](projects/azure-resource-operations)
- [CI/CD pipeline automation](projects/cicd-automation)
- [Monitoring and incident response](projects/monitoring-incident-response)
- [Configuration and compliance](projects/configuration-compliance)
- [Reporting and platform health](projects/platform-health-reporting)

The weekly project use-case index is refreshed every Monday at **7:00 AM IST** by [update-project-use-cases.yml](.github/workflows/update-project-use-cases.yml).

Read the current rotation in [projects/DAILY_USE_CASES.md](projects/DAILY_USE_CASES.md) and preserved weekly snapshots in [projects/use-case-history](projects/use-case-history). Historical use cases are never deleted.

Prepare with [PowerShell DevOps interview questions](interview-prep/README.md) covering Microsoft operations and MAANG-scale automation design.

## Common commands

Run scripts from their example directory:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
pwsh -File .\script.ps1
```

Use `-WhatIf` for scripts that change infrastructure, never hardcode secrets, and prefer managed identity, environment variables, or secure pipeline secret stores.

## Structure

```text
beginner/
intermediate/
advanced/
projects/
.github/workflows/update-project-use-cases.yml
```