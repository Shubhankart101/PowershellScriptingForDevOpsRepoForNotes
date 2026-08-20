# PowerShell DevOps interview preparation

These are interview-style prompts for PowerShell automation, Azure operations, and platform engineering. They are study questions, not claims about any company's exact interview loop.

## Microsoft-oriented questions

1. How would you build a safe PowerShell automation script for Azure resource operations?
2. When would you use Az PowerShell versus Azure CLI invoked from PowerShell?
3. How do `-WhatIf`, `ShouldProcess`, managed identity, and protected pipeline secrets reduce deployment risk?
4. How would you structure a PowerShell module shared by multiple engineering teams?
5. How would you collect diagnostics during a production incident without exposing secrets or overwhelming the system?
6. How would you integrate PowerShell into Azure DevOps, GitHub Actions, and GitLab CI/CD?
7. How would you explain a failed automation run to a customer and provide a recovery plan?
8. How would you validate PowerShell scripts before allowing production execution?

## MAANG-oriented questions

1. Design a PowerShell automation service that runs thousands of operations safely and concurrently.
2. How would you implement bounded retries, timeouts, cancellation, rate-limit handling, and idempotency?
3. How do PowerShell objects differ from text-based shell pipelines, and why does that matter for reliability?
4. How would you prevent parallel jobs from corrupting shared files, state, or credentials?
5. How would you design structured logs and correlation IDs for debugging distributed automation?
6. How would you package, version, test, sign, and roll back a shared PowerShell module?
7. How would you test a script that calls external APIs and changes cloud resources?
8. What would you measure: duration, failure rate, retry count, change volume, recovery time, and policy violations?

## Project mapping

- **Azure operations:** inventory, tags, safe remediation, exit codes, identity, and Resource Graph.
- **CI/CD automation:** release metadata, pipeline variables, artifacts, and deployment gates.
- **Monitoring and incident response:** diagnostics, evidence collection, correlation, and escalation.
- **Configuration compliance:** baselines, drift, `-WhatIf`, signing, and audit output.
- **Platform health reporting:** thresholds, JSON/CSV reports, trends, SLOs, and notifications.

## SRE and DevOps Engineering questions

1. How would you define SLOs and error budgets for a PowerShell-driven deployment platform?
2. How would you make automation idempotent, observable, retryable, and safe to rerun during incidents?
3. How would you reduce operational toil with modules, self-service commands, runbooks, and automation ownership?
4. How would you collect evidence during a production incident while protecting secrets and limiting load?
5. How would you design alert thresholds to avoid both missed incidents and alert fatigue?
6. How would you roll back a failed cloud change and verify service recovery?
7. How would you measure automation reliability, mean time to recovery, change failure rate, and deployment frequency?
8. How would you review a PowerShell script for security, reliability, portability, and operational supportability?

## Strong answer checklist

Explain the input contract, safety boundary, happy path, failure path, retry policy, secret handling, logging, tests, and rollback. Mention how the solution works locally and in a managed CI/CD environment.
