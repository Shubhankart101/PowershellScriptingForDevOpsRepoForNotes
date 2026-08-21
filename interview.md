# PowerShell for DevOps Interview Question Bank

This bank contains 150 questions organized by difficulty, covering PowerShell automation, Azure, APIs, Windows operations, CI/CD, and reliability.

## Worked Answers

### Beginner: objects and validation

**Question:** How do you count log levels from pipeline objects?

```powershell
function Get-LogLevelCounts {
	param([object[]]$Records)
	$Records | Group-Object Level | ForEach-Object {
		[pscustomobject]@{ Level = $_.Name; Count = $_.Count }
	}
}
```

The function receives objects, groups them by `Level`, and returns structured objects that can continue through the PowerShell pipeline.

### Intermediate: retry with backoff

**Question:** How do you retry a transient operation safely?

```powershell
function Invoke-WithRetry {
	param([scriptblock]$Action, [int]$Attempts = 3)
	for ($attempt = 1; $attempt -le $Attempts; $attempt++) {
		try { return (& $Action) }
		catch {
			if ($attempt -eq $Attempts) { throw }
			Start-Sleep -Seconds ([math]::Pow(2, $attempt - 1))
		}
	}
}
```

Only transient work should be retried, and the final exception must remain visible to CI.

### Advanced: health-gated rollback

**Question:** How do you roll back when deployment health checks fail?

```powershell
& $Deploy $Release
try {
	if (-not (& $Health)) { throw 'health check failed' }
}
catch {
	& $Rollback $Release
	throw
}
```

The deployment is promoted only after health succeeds; rollback runs before the failure is returned.

## Beginner: 1-40

1. What makes PowerShell useful for DevOps?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 1 script](interview-scripts/001-what-makes-powershell-useful-for-devops.ps1)
2. What is an object in PowerShell?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 2 script](interview-scripts/002-what-is-an-object-in-powershell.ps1)
3. How does the pipeline pass objects?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 3 script](interview-scripts/003-how-does-the-pipeline-pass-objects.ps1)
4. What does `Get-Command` do?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 4 script](interview-scripts/004-what-does-get-command-do.ps1)
5. What does `Get-Help` provide?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 5 script](interview-scripts/005-what-does-get-help-provide.ps1)
6. What does `Get-Member` show?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 6 script](interview-scripts/006-what-does-get-member-show.ps1)
7. How do you assign a variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 7 script](interview-scripts/007-how-do-you-assign-a-variable.ps1)
8. What is an array?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 8 script](interview-scripts/008-what-is-an-array.ps1)
9. What is a hashtable?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 9 script](interview-scripts/009-what-is-a-hashtable.ps1)
10. How do you access a property?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 10 script](interview-scripts/010-how-do-you-access-a-property.ps1)
11. How do you filter pipeline objects?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 11 script](interview-scripts/011-how-do-you-filter-pipeline-objects.ps1)
12. How do you select properties?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 12 script](interview-scripts/012-how-do-you-select-properties.ps1)
13. What is the difference between `Where-Object` and `ForEach-Object`?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 13 script](interview-scripts/013-what-is-the-difference-between-where-object-and-foreach.ps1)
14. How do you create a function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 14 script](interview-scripts/014-how-do-you-create-a-function.ps1)
15. What is a parameter block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 15 script](interview-scripts/015-what-is-a-parameter-block.ps1)
16. How do you validate parameters?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 16 script](interview-scripts/016-how-do-you-validate-parameters.ps1)
17. What does `Set-StrictMode` do?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 17 script](interview-scripts/017-what-does-set-strictmode-do.ps1)
18. Why use `$ErrorActionPreference = 'Stop'`?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 18 script](interview-scripts/018-why-use-erroractionpreference-stop.ps1)
19. How do `try`, `catch`, and `finally` work?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 19 script](interview-scripts/019-how-do-try-catch-and-finally-work.ps1)
20. How do you write a terminating error?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 20 script](interview-scripts/020-how-do-you-write-a-terminating-error.ps1)
21. How do you read a file?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 21 script](interview-scripts/021-how-do-you-read-a-file.ps1)
22. How do you write a file?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 22 script](interview-scripts/022-how-do-you-write-a-file.ps1)
23. How do you work with JSON?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 23 script](interview-scripts/023-how-do-you-work-with-json.ps1)
24. How do you work with CSV?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 24 script](interview-scripts/024-how-do-you-work-with-csv.ps1)
25. How do you read an environment variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
Script: [Question 25 script](interview-scripts/025-how-do-you-read-an-environment-variable.ps1)
26. How do you call an external command?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 26 script](interview-scripts/026-how-do-you-call-an-external-command.ps1)
27. How do you capture command output?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 27 script](interview-scripts/027-how-do-you-capture-command-output.ps1)
28. How do you return an exit code?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 28 script](interview-scripts/028-how-do-you-return-an-exit-code.ps1)
29. What does `-WhatIf` do?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 29 script](interview-scripts/029-what-does-whatif-do.ps1)
30. What does `-Confirm` do?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 30 script](interview-scripts/030-what-does-confirm-do.ps1)
31. How do you test whether a path exists?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 31 script](interview-scripts/031-how-do-you-test-whether-a-path-exists.ps1)
32. How do you create a directory safely?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
Script: [Question 32 script](interview-scripts/032-how-do-you-create-a-directory-safely.ps1)
33. How do you manage a Windows service?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
Script: [Question 33 script](interview-scripts/033-how-do-you-manage-a-windows-service.ps1)
34. How do you list processes?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 34 script](interview-scripts/034-how-do-you-list-processes.ps1)
35. How do you query event logs?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 35 script](interview-scripts/035-how-do-you-query-event-logs.ps1)
36. What is a PowerShell module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 36 script](interview-scripts/036-what-is-a-powershell-module.ps1)
37. How do you import a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 37 script](interview-scripts/037-how-do-you-import-a-module.ps1)
38. What is a script scope?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 38 script](interview-scripts/038-what-is-a-script-scope.ps1)
39. How do you add comments and help to a script?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 39 script](interview-scripts/039-how-do-you-add-comments-and-help-to-a-script.ps1)
40. How do you run PSScriptAnalyzer?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 40 script](interview-scripts/040-how-do-you-run-psscriptanalyzer.ps1)

## Intermediate: 41-80

41. How do you design an advanced function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 41 script](interview-scripts/041-how-do-you-design-an-advanced-function.ps1)
42. What is `[CmdletBinding()]`?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 42 script](interview-scripts/042-what-is-cmdletbinding.ps1)
43. How do parameter sets work?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 43 script](interview-scripts/043-how-do-parameter-sets-work.ps1)
44. What is pipeline input by property name?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 44 script](interview-scripts/044-what-is-pipeline-input-by-property-name.ps1)
45. How do you emit objects from a function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 45 script](interview-scripts/045-how-do-you-emit-objects-from-a-function.ps1)
46. How do you avoid formatting data inside reusable functions?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 46 script](interview-scripts/046-how-do-you-avoid-formatting-data-inside-reusable-functi.ps1)
47. How do you create a module manifest?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 47 script](interview-scripts/047-how-do-you-create-a-module-manifest.ps1)
48. How do you write module private helper functions?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 48 script](interview-scripts/048-how-do-you-write-module-private-helper-functions.ps1)
49. How do you implement structured logging?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 49 script](interview-scripts/049-how-do-you-implement-structured-logging.ps1)
50. How do you add correlation IDs to logs?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 50 script](interview-scripts/050-how-do-you-add-correlation-ids-to-logs.ps1)
51. How do you implement retry with exponential backoff?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
Script: [Question 51 script](interview-scripts/051-how-do-you-implement-retry-with-exponential-backoff.ps1)
52. How do you handle HTTP status codes with `Invoke-RestMethod`?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 52 script](interview-scripts/052-how-do-you-handle-http-status-codes-with-invoke-restmet.ps1)
53. How do you paginate a REST API?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 53 script](interview-scripts/053-how-do-you-paginate-a-rest-api.ps1)
54. How do you handle API throttling?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
Script: [Question 54 script](interview-scripts/054-how-do-you-handle-api-throttling.ps1)
55. How do you use custom headers securely?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 55 script](interview-scripts/055-how-do-you-use-custom-headers-securely.ps1)
56. How do you parse nested JSON?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 56 script](interview-scripts/056-how-do-you-parse-nested-json.ps1)
57. How do you validate JSON input?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 57 script](interview-scripts/057-how-do-you-validate-json-input.ps1)
58. How do you call Azure CLI from PowerShell safely?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 58 script](interview-scripts/058-how-do-you-call-azure-cli-from-powershell-safely.ps1)
59. How do you use Az PowerShell modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 59 script](interview-scripts/059-how-do-you-use-az-powershell-modules.ps1)
60. How do you authenticate with managed identity?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 60 script](interview-scripts/060-how-do-you-authenticate-with-managed-identity.ps1)
61. How do you handle Azure subscription context?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 61 script](interview-scripts/061-how-do-you-handle-azure-subscription-context.ps1)
62. How do you use AWS Tools for PowerShell?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 62 script](interview-scripts/062-how-do-you-use-aws-tools-for-powershell.ps1)
63. How do you select an AWS region and profile?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 63 script](interview-scripts/063-how-do-you-select-an-aws-region-and-profile.ps1)
64. How do you implement a dry-run switch?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 64 script](interview-scripts/064-how-do-you-implement-a-dry-run-switch.ps1)
65. How do you run work in parallel?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 65 script](interview-scripts/065-how-do-you-run-work-in-parallel.ps1)
66. What are the limitations of `ForEach-Object -Parallel`?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 66 script](interview-scripts/066-what-are-the-limitations-of-foreach-object-parallel.ps1)
67. How do you throttle parallel work?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
Script: [Question 67 script](interview-scripts/067-how-do-you-throttle-parallel-work.ps1)
68. How do you collect parallel errors?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 68 script](interview-scripts/068-how-do-you-collect-parallel-errors.ps1)
69. How do you use jobs and receive their output?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 69 script](interview-scripts/069-how-do-you-use-jobs-and-receive-their-output.ps1)
70. How do you clean up background jobs?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 70 script](interview-scripts/070-how-do-you-clean-up-background-jobs.ps1)
71. How do you create a Pester test?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 71 script](interview-scripts/071-how-do-you-create-a-pester-test.ps1)
72. How do you mock a command in Pester?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 72 script](interview-scripts/072-how-do-you-mock-a-command-in-pester.ps1)
73. How do you test error paths?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 73 script](interview-scripts/073-how-do-you-test-error-paths.ps1)
74. How do you publish Pester results in CI?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 74 script](interview-scripts/074-how-do-you-publish-pester-results-in-ci.ps1)
75. How do you run scripts on remote computers?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 75 script](interview-scripts/075-how-do-you-run-scripts-on-remote-computers.ps1)
76. What are PowerShell remoting security concerns?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
Script: [Question 76 script](interview-scripts/076-what-are-powershell-remoting-security-concerns.ps1)
77. How do you manage Windows scheduled tasks?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 77 script](interview-scripts/077-how-do-you-manage-windows-scheduled-tasks.ps1)
78. How do you manage certificates?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 78 script](interview-scripts/078-how-do-you-manage-certificates.ps1)
79. How do you create a reusable deployment helper?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 79 script](interview-scripts/079-how-do-you-create-a-reusable-deployment-helper.ps1)
80. How do you make a PowerShell script idempotent?
**Answer:** Make the operation converge on the declared state and check the current state before mutating it, so a second run produces no unnecessary change.
Script: [Question 80 script](interview-scripts/080-how-do-you-make-a-powershell-script-idempotent.ps1)

## Advanced: 81-120

81. Design a production PowerShell automation module.
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 81 script](interview-scripts/081-design-a-production-powershell-automation-module.ps1)
82. How do you separate public and private module functions?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 82 script](interview-scripts/082-how-do-you-separate-public-and-private-module-functions.ps1)
83. How do you version a module safely?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 83 script](interview-scripts/083-how-do-you-version-a-module-safely.ps1)
84. How do you publish modules to an internal repository?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 84 script](interview-scripts/084-how-do-you-publish-modules-to-an-internal-repository.ps1)
85. How do you sign PowerShell scripts?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 85 script](interview-scripts/085-how-do-you-sign-powershell-scripts.ps1)
86. How do execution policies affect deployment?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 86 script](interview-scripts/086-how-do-execution-policies-affect-deployment.ps1)
87. How do you protect secrets in PowerShell automation?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
Script: [Question 87 script](interview-scripts/087-how-do-you-protect-secrets-in-powershell-automation.ps1)
88. How do you use Azure workload identity from CI?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 88 script](interview-scripts/088-how-do-you-use-azure-workload-identity-from-ci.ps1)
89. How do you use AWS OIDC federation from CI?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 89 script](interview-scripts/089-how-do-you-use-aws-oidc-federation-from-ci.ps1)
90. How do you prevent command injection in native calls?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 90 script](interview-scripts/090-how-do-you-prevent-command-injection-in-native-calls.ps1)
91. How do you safely construct argument lists?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 91 script](interview-scripts/091-how-do-you-safely-construct-argument-lists.ps1)
92. How do you handle secure strings and their limitations?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
Script: [Question 92 script](interview-scripts/092-how-do-you-handle-secure-strings-and-their-limitations.ps1)
93. How do you design retries that do not duplicate mutations?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 93 script](interview-scripts/093-how-do-you-design-retries-that-do-not-duplicate-mutatio.ps1)
94. How do you reconcile desired and actual cloud state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
Script: [Question 94 script](interview-scripts/094-how-do-you-reconcile-desired-and-actual-cloud-state.ps1)
95. How do you handle eventual consistency in Azure APIs?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 95 script](interview-scripts/095-how-do-you-handle-eventual-consistency-in-azure-apis.ps1)
96. How do you handle eventual consistency in AWS APIs?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
Script: [Question 96 script](interview-scripts/096-how-do-you-handle-eventual-consistency-in-aws-apis.ps1)
97. How do you coordinate changes across subscriptions?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 97 script](interview-scripts/097-how-do-you-coordinate-changes-across-subscriptions.ps1)
98. How do you coordinate changes across AWS accounts?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
Script: [Question 98 script](interview-scripts/098-how-do-you-coordinate-changes-across-aws-accounts.ps1)
99. How do you implement blue-green deployment in PowerShell?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 99 script](interview-scripts/099-how-do-you-implement-blue-green-deployment-in-powershel.ps1)
100. How do you implement health-gated rollback?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
Script: [Question 100 script](interview-scripts/100-how-do-you-implement-health-gated-rollback.ps1)
101. How do you orchestrate rolling Windows patching?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 101 script](interview-scripts/101-how-do-you-orchestrate-rolling-windows-patching.ps1)
102. How do you prevent a fleet-wide outage during patching?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 102 script](interview-scripts/102-how-do-you-prevent-a-fleet-wide-outage-during-patching.ps1)
103. How do you automate certificate expiry remediation?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 103 script](interview-scripts/103-how-do-you-automate-certificate-expiry-remediation.ps1)
104. How do you validate backup and restore operations?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 104 script](interview-scripts/104-how-do-you-validate-backup-and-restore-operations.ps1)
105. How do you design a disaster-recovery runbook script?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
Script: [Question 105 script](interview-scripts/105-how-do-you-design-a-disaster-recovery-runbook-script.ps1)
106. How do you emit metrics from a script?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 106 script](interview-scripts/106-how-do-you-emit-metrics-from-a-script.ps1)
107. How do you integrate logs with Azure Monitor or CloudWatch?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 107 script](interview-scripts/107-how-do-you-integrate-logs-with-azure-monitor-or-cloudwa.ps1)
108. How do you trace a request across API calls?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 108 script](interview-scripts/108-how-do-you-trace-a-request-across-api-calls.ps1)
109. How do you design a script for offline execution?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 109 script](interview-scripts/109-how-do-you-design-a-script-for-offline-execution.ps1)
110. How do you support Windows PowerShell and PowerShell 7?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
Script: [Question 110 script](interview-scripts/110-how-do-you-support-windows-powershell-and-powershell-7.ps1)
111. How do you test compatibility across PowerShell versions?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
Script: [Question 111 script](interview-scripts/111-how-do-you-test-compatibility-across-powershell-version.ps1)
112. How do you manage module dependency locking?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
Script: [Question 112 script](interview-scripts/112-how-do-you-manage-module-dependency-locking.ps1)
113. How do you build a secure self-hosted runner?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
Script: [Question 113 script](interview-scripts/113-how-do-you-build-a-secure-self-hosted-runner.ps1)
114. How do you handle partial failure in parallel execution?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
Script: [Question 114 script](interview-scripts/114-how-do-you-handle-partial-failure-in-parallel-execution.ps1)
115. How do you make a script resumable?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 115 script](interview-scripts/115-how-do-you-make-a-script-resumable.ps1)
116. How do you audit administrative actions?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 116 script](interview-scripts/116-how-do-you-audit-administrative-actions.ps1)
117. How do you profile a slow PowerShell script?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
Script: [Question 117 script](interview-scripts/117-how-do-you-profile-a-slow-powershell-script.ps1)
118. How do you diagnose memory growth in a long-running runspace?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
Script: [Question 118 script](interview-scripts/118-how-do-you-diagnose-memory-growth-in-a-long-running-run.ps1)
119. How do you design operational safety controls for destructive commands?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
Script: [Question 119 script](interview-scripts/119-how-do-you-design-operational-safety-controls-for-destr.ps1)
120. Design a secure, observable, cross-cloud PowerShell automation platform.
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
Script: [Question 120 script](interview-scripts/120-design-a-secure-observable-cross-cloud-powershell-autom.ps1)

## HackerRank-Style PowerShell Challenges: 121-150

121. Count log levels from pipeline objects.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 121 script](interview-scripts/121-count-log-levels-from-pipeline-objects.ps1)
122. Return the first duplicate deployment ID.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 122 script](interview-scripts/122-return-the-first-duplicate-deployment-id.ps1)
123. Merge overlapping maintenance windows.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 123 script](interview-scripts/123-merge-overlapping-maintenance-windows.ps1)
124. Group hosts by environment.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 124 script](interview-scripts/124-group-hosts-by-environment.ps1)
125. Return the top three error codes.
**Answer:** Parse the input into structured records, use a map or counter for aggregation, sort only when ranking is required, and test empty, duplicate, and boundary inputs.
Script: [Question 125 script](interview-scripts/125-return-the-top-three-error-codes.ps1)
126. Create an advanced function with a validated environment parameter.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 126 script](interview-scripts/126-create-an-advanced-function-with-a-validated-environmen.ps1)
127. Convert objects to stable JSON.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 127 script](interview-scripts/127-convert-objects-to-stable-json.ps1)
128. Validate required CSV columns.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 128 script](interview-scripts/128-validate-required-csv-columns.ps1)
129. Implement retry with exponential backoff.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 129 script](interview-scripts/129-implement-retry-with-exponential-backoff.ps1)
130. Wrap a command with timeout and exit-code validation.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 130 script](interview-scripts/130-wrap-a-command-with-timeout-and-exit-code-validation.ps1)
131. Follow pagination links with `Invoke-RestMethod`.
**Answer:** Use explicit authentication, timeouts, status handling, pagination, rate-limit handling, and structured response validation; never place credentials in source.
Script: [Question 131 script](interview-scripts/131-follow-pagination-links-with-invoke-restmethod.ps1)
132. Handle HTTP 429 responses.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 132 script](interview-scripts/132-handle-http-429-responses.ps1)
133. Calculate a file hash.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
Script: [Question 133 script](interview-scripts/133-calculate-a-file-hash.ps1)
134. Extract an archive while rejecting traversal paths.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
Script: [Question 134 script](interview-scripts/134-extract-an-archive-while-rejecting-traversal-paths.ps1)
135. Compare desired and actual hashtables.
**Answer:** Verify the expected digest before use and reject absolute paths or .. traversal entries before extracting or writing files.
Script: [Question 135 script](interview-scripts/135-compare-desired-and-actual-hashtables.ps1)
136. Run a throttled parallel worker.
**Answer:** Use a bounded worker pool, collect each success and exception separately, and fail the operation when the defined error threshold is exceeded.
Script: [Question 136 script](interview-scripts/136-run-a-throttled-parallel-worker.ps1)
137. Separate successful and failed parallel results.
**Answer:** Use a bounded worker pool, collect each success and exception separately, and fail the operation when the defined error threshold is exceeded.
Script: [Question 137 script](interview-scripts/137-separate-successful-and-failed-parallel-results.ps1)
138. Build a resumable batch script with a checkpoint JSON file.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 138 script](interview-scripts/138-build-a-resumable-batch-script-with-a-checkpoint-json-f.ps1)
139. Pass native-command arguments safely as an array.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for PowerShell.
Script: [Question 139 script](interview-scripts/139-pass-native-command-arguments-safely-as-an-array.ps1)
140. Load configuration with environment overrides.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 140 script](interview-scripts/140-load-configuration-with-environment-overrides.ps1)
141. Define a deployment request parameter class.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
Script: [Question 141 script](interview-scripts/141-define-a-deployment-request-parameter-class.ps1)
142. Test retry and error paths with Pester.
**Answer:** Retry only transient failures with a bounded exponential backoff, enforce a timeout, and return the original failure after the retry budget is exhausted.
Script: [Question 142 script](interview-scripts/142-test-retry-and-error-paths-with-pester.ps1)
143. Mock an Az cmdlet and test idempotent creation.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 143 script](interview-scripts/143-mock-an-az-cmdlet-and-test-idempotent-creation.ps1)
144. Mock an AWS cmdlet and test missing-resource handling.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 144 script](interview-scripts/144-mock-an-aws-cmdlet-and-test-missing-resource-handling.ps1)
145. Emit structured JSON logs with a correlation ID.
**Answer:** Parse with the platform's structured data tool, validate required fields and types at the boundary, and return a clear nonzero failure for malformed input.
Script: [Question 145 script](interview-scripts/145-emit-structured-json-logs-with-a-correlation-id.ps1)
146. Map exceptions to stable process exit codes.
**Answer:** Implement the solution with validated inputs, deterministic behavior, clear failure handling, tests, and an example execution command for PowerShell.
Script: [Question 146 script](interview-scripts/146-map-exceptions-to-stable-process-exit-codes.ps1)
147. Use runspaces for bounded concurrent API calls.
**Answer:** Use a bounded worker pool, collect each success and exception separately, and fail the operation when the defined error threshold is exceeded.
Script: [Question 147 script](interview-scripts/147-use-runspaces-for-bounded-concurrent-api-calls.ps1)
148. Report dependency status with a health function.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
Script: [Question 148 script](interview-scripts/148-report-dependency-status-with-a-health-function.ps1)
149. Emit deployment duration and failure metrics.
**Answer:** Deploy an immutable version, run a health or smoke check, promote only on success, and invoke a tested rollback while preserving the failure in logs.
Script: [Question 149 script](interview-scripts/149-emit-deployment-duration-and-failure-metrics.ps1)
150. Build a tested PowerShell module for safe deployment.
**Answer:** Test the happy path, invalid input, timeout, retry exhaustion, and partial failure with mocks for external systems and an assertion on the final result.
Script: [Question 150 script](interview-scripts/150-build-a-tested-powershell-module-for-safe-deployment.ps1)

## Executable Answers

- [Beginner answers](interview-answers/beginner.ps1): object grouping, validation, and safe error handling.
- [Intermediate answers](interview-answers/intermediate.ps1): retry, pagination, and reusable functions.
- [Advanced answers](interview-answers/advanced.ps1): health-gated deployment and rollback.
