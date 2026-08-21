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
2. What is an object in PowerShell?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
3. How does the pipeline pass objects?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
4. What does `Get-Command` do?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
5. What does `Get-Help` provide?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
6. What does `Get-Member` show?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
7. How do you assign a variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
8. What is an array?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
9. What is a hashtable?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
10. How do you access a property?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
11. How do you filter pipeline objects?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
12. How do you select properties?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
13. What is the difference between `Where-Object` and `ForEach-Object`?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
14. How do you create a function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
15. What is a parameter block?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
16. How do you validate parameters?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
17. What does `Set-StrictMode` do?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
18. Why use `$ErrorActionPreference = 'Stop'`?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
19. How do `try`, `catch`, and `finally` work?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
20. How do you write a terminating error?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
21. How do you read a file?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
22. How do you write a file?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
23. How do you work with JSON?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
24. How do you work with CSV?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
25. How do you read an environment variable?
**Answer:** Keep environment-specific values outside reusable logic, validate them at the boundary, and provide safe defaults only where appropriate.
26. How do you call an external command?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
27. How do you capture command output?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
28. How do you return an exit code?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
29. What does `-WhatIf` do?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
30. What does `-Confirm` do?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
31. How do you test whether a path exists?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
32. How do you create a directory safely?
**Answer:** Use structured filesystem APIs, validate paths, quote inputs, handle missing resources deliberately, and avoid unsafe traversal or shell expansion.
33. How do you manage a Windows service?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
34. How do you list processes?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
35. How do you query event logs?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
36. What is a PowerShell module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
37. How do you import a module?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
38. What is a script scope?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
39. How do you add comments and help to a script?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
40. How do you run PSScriptAnalyzer?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.

## Intermediate: 41-80

41. How do you design an advanced function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
42. What is `[CmdletBinding()]`?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
43. How do parameter sets work?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
44. What is pipeline input by property name?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
45. How do you emit objects from a function?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
46. How do you avoid formatting data inside reusable functions?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
47. How do you create a module manifest?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
48. How do you write module private helper functions?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
49. How do you implement structured logging?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
50. How do you add correlation IDs to logs?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
51. How do you implement retry with exponential backoff?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
52. How do you handle HTTP status codes with `Invoke-RestMethod`?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
53. How do you paginate a REST API?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
54. How do you handle API throttling?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
55. How do you use custom headers securely?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
56. How do you parse nested JSON?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
57. How do you validate JSON input?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
58. How do you call Azure CLI from PowerShell safely?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
59. How do you use Az PowerShell modules?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
60. How do you authenticate with managed identity?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
61. How do you handle Azure subscription context?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
62. How do you use AWS Tools for PowerShell?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
63. How do you select an AWS region and profile?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
64. How do you implement a dry-run switch?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
65. How do you run work in parallel?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
66. What are the limitations of `ForEach-Object -Parallel`?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
67. How do you throttle parallel work?
**Answer:** Retry only transient failures, use bounded exponential backoff with jitter, and return the final error when the retry budget is exhausted.
68. How do you collect parallel errors?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
69. How do you use jobs and receive their output?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
70. How do you clean up background jobs?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
71. How do you create a Pester test?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
72. How do you mock a command in Pester?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
73. How do you test error paths?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
74. How do you publish Pester results in CI?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
75. How do you run scripts on remote computers?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
76. What are PowerShell remoting security concerns?
**Answer:** Apply least privilege, isolate trust boundaries, validate policy in CI or admission, and record auditable changes.
77. How do you manage Windows scheduled tasks?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
78. How do you manage certificates?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
79. How do you create a reusable deployment helper?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
80. How do you make a PowerShell script idempotent?
**Answer:** Make the operation converge on the declared state and check the current state before mutating it, so a second run produces no unnecessary change.

## Advanced: 81-120

81. Design a production PowerShell automation module.
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
82. How do you separate public and private module functions?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
83. How do you version a module safely?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
84. How do you publish modules to an internal repository?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
85. How do you sign PowerShell scripts?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
86. How do execution policies affect deployment?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
87. How do you protect secrets in PowerShell automation?
**Answer:** Keep the value in a protected secret store or workload identity, pass it at runtime, redact it from logs, and never commit it to source control.
88. How do you use Azure workload identity from CI?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
89. How do you use AWS OIDC federation from CI?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
90. How do you prevent command injection in native calls?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
91. How do you safely construct argument lists?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
92. How do you handle secure strings and their limitations?
**Answer:** Declare requests and limits, measure real usage, set explicit capacity bounds, and test behavior under saturation and recovery.
93. How do you design retries that do not duplicate mutations?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
94. How do you reconcile desired and actual cloud state?
**Answer:** Store shared state remotely with encryption, access control, locking, versioning, and a tested recovery process.
95. How do you handle eventual consistency in Azure APIs?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
96. How do you handle eventual consistency in AWS APIs?
**Answer:** Use a structured client, explicit timeouts, status handling, pagination, schema validation, and safe authentication rather than string parsing.
97. How do you coordinate changes across subscriptions?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
98. How do you coordinate changes across AWS accounts?
**Answer:** Use provider-native identity with least privilege, explicit environment boundaries, tagging, policy controls, and repeatable infrastructure definitions.
99. How do you implement blue-green deployment in PowerShell?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
100. How do you implement health-gated rollback?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
101. How do you orchestrate rolling Windows patching?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
102. How do you prevent a fleet-wide outage during patching?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
103. How do you automate certificate expiry remediation?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
104. How do you validate backup and restore operations?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
105. How do you design a disaster-recovery runbook script?
**Answer:** Keep the previous known-good version, validate the replacement, and automate a tested rollback or restore path with clear ownership and audit output.
106. How do you emit metrics from a script?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
107. How do you integrate logs with Azure Monitor or CloudWatch?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
108. How do you trace a request across API calls?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
109. How do you design a script for offline execution?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
110. How do you support Windows PowerShell and PowerShell 7?
**Answer:** Define the smallest required traffic path, restrict it with policy and identity, and verify connectivity from the same network boundary as the workload.
111. How do you test compatibility across PowerShell versions?
**Answer:** Automate syntax, static analysis, unit, and integration checks in CI; fail early and publish useful diagnostics as artifacts.
112. How do you manage module dependency locking?
**Answer:** Extract the behavior behind a small documented interface, keep inputs and outputs explicit, and test the reusable unit independently.
113. How do you build a secure self-hosted runner?
**Answer:** Separate validation, build, promotion, and verification; use immutable artifacts, protected production controls, and an observable rollback path.
114. How do you handle partial failure in parallel execution?
**Answer:** Bound concurrency, preserve a small failure domain, verify health between batches, and stop promotion when the error budget is exceeded.
115. How do you make a script resumable?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
116. How do you audit administrative actions?
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.
117. How do you profile a slow PowerShell script?
**Answer:** Check a meaningful dependency or application endpoint, fail the operation when the check fails, and use the result to stop or roll back promotion.
118. How do you diagnose memory growth in a long-running runspace?
**Answer:** A strong answer should define the concept, show a small PowerShell implementation, explain failure behavior, and describe how it would be tested in CI.
119. How do you design operational safety controls for destructive commands?
**Answer:** Encapsulate the operation behind validated inputs, explicit exit behavior, safe argument handling, logging, and a testable return value.
120. Design a secure, observable, cross-cloud PowerShell automation platform.
**Answer:** Emit structured, correlation-aware telemetry with enough context to diagnose duration, failures, deployment version, and affected environment.

## HackerRank-Style PowerShell Challenges: 121-150

121. Count log levels from pipeline objects.
122. Return the first duplicate deployment ID.
123. Merge overlapping maintenance windows.
124. Group hosts by environment.
125. Return the top three error codes.
126. Create an advanced function with a validated environment parameter.
127. Convert objects to stable JSON.
128. Validate required CSV columns.
129. Implement retry with exponential backoff.
130. Wrap a command with timeout and exit-code validation.
131. Follow pagination links with `Invoke-RestMethod`.
132. Handle HTTP 429 responses.
133. Calculate a file hash.
134. Extract an archive while rejecting traversal paths.
135. Compare desired and actual hashtables.
136. Run a throttled parallel worker.
137. Separate successful and failed parallel results.
138. Build a resumable batch script with a checkpoint JSON file.
139. Pass native-command arguments safely as an array.
140. Load configuration with environment overrides.
141. Define a deployment request parameter class.
142. Test retry and error paths with Pester.
143. Mock an Az cmdlet and test idempotent creation.
144. Mock an AWS cmdlet and test missing-resource handling.
145. Emit structured JSON logs with a correlation ID.
146. Map exceptions to stable process exit codes.
147. Use runspaces for bounded concurrent API calls.
148. Report dependency status with a health function.
149. Emit deployment duration and failure metrics.
150. Build a tested PowerShell module for safe deployment.

## Executable Answers

- [Beginner answers](interview-answers/beginner.ps1): object grouping, validation, and safe error handling.
- [Intermediate answers](interview-answers/intermediate.ps1): retry, pagination, and reusable functions.
- [Advanced answers](interview-answers/advanced.ps1): health-gated deployment and rollback.
