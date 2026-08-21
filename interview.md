# PowerShell for DevOps Interview Question Bank

This bank contains 120 questions organized by difficulty, covering PowerShell automation, Azure, APIs, Windows operations, CI/CD, and reliability.

## Beginner: 1-40

1. What makes PowerShell useful for DevOps?
2. What is an object in PowerShell?
3. How does the pipeline pass objects?
4. What does `Get-Command` do?
5. What does `Get-Help` provide?
6. What does `Get-Member` show?
7. How do you assign a variable?
8. What is an array?
9. What is a hashtable?
10. How do you access a property?
11. How do you filter pipeline objects?
12. How do you select properties?
13. What is the difference between `Where-Object` and `ForEach-Object`?
14. How do you create a function?
15. What is a parameter block?
16. How do you validate parameters?
17. What does `Set-StrictMode` do?
18. Why use `$ErrorActionPreference = 'Stop'`?
19. How do `try`, `catch`, and `finally` work?
20. How do you write a terminating error?
21. How do you read a file?
22. How do you write a file?
23. How do you work with JSON?
24. How do you work with CSV?
25. How do you read an environment variable?
26. How do you call an external command?
27. How do you capture command output?
28. How do you return an exit code?
29. What does `-WhatIf` do?
30. What does `-Confirm` do?
31. How do you test whether a path exists?
32. How do you create a directory safely?
33. How do you manage a Windows service?
34. How do you list processes?
35. How do you query event logs?
36. What is a PowerShell module?
37. How do you import a module?
38. What is a script scope?
39. How do you add comments and help to a script?
40. How do you run PSScriptAnalyzer?

## Intermediate: 41-80

41. How do you design an advanced function?
42. What is `[CmdletBinding()]`?
43. How do parameter sets work?
44. What is pipeline input by property name?
45. How do you emit objects from a function?
46. How do you avoid formatting data inside reusable functions?
47. How do you create a module manifest?
48. How do you write module private helper functions?
49. How do you implement structured logging?
50. How do you add correlation IDs to logs?
51. How do you implement retry with exponential backoff?
52. How do you handle HTTP status codes with `Invoke-RestMethod`?
53. How do you paginate a REST API?
54. How do you handle API throttling?
55. How do you use custom headers securely?
56. How do you parse nested JSON?
57. How do you validate JSON input?
58. How do you call Azure CLI from PowerShell safely?
59. How do you use Az PowerShell modules?
60. How do you authenticate with managed identity?
61. How do you handle Azure subscription context?
62. How do you use AWS Tools for PowerShell?
63. How do you select an AWS region and profile?
64. How do you implement a dry-run switch?
65. How do you run work in parallel?
66. What are the limitations of `ForEach-Object -Parallel`?
67. How do you throttle parallel work?
68. How do you collect parallel errors?
69. How do you use jobs and receive their output?
70. How do you clean up background jobs?
71. How do you create a Pester test?
72. How do you mock a command in Pester?
73. How do you test error paths?
74. How do you publish Pester results in CI?
75. How do you run scripts on remote computers?
76. What are PowerShell remoting security concerns?
77. How do you manage Windows scheduled tasks?
78. How do you manage certificates?
79. How do you create a reusable deployment helper?
80. How do you make a PowerShell script idempotent?

## Advanced: 81-120

81. Design a production PowerShell automation module.
82. How do you separate public and private module functions?
83. How do you version a module safely?
84. How do you publish modules to an internal repository?
85. How do you sign PowerShell scripts?
86. How do execution policies affect deployment?
87. How do you protect secrets in PowerShell automation?
88. How do you use Azure workload identity from CI?
89. How do you use AWS OIDC federation from CI?
90. How do you prevent command injection in native calls?
91. How do you safely construct argument lists?
92. How do you handle secure strings and their limitations?
93. How do you design retries that do not duplicate mutations?
94. How do you reconcile desired and actual cloud state?
95. How do you handle eventual consistency in Azure APIs?
96. How do you handle eventual consistency in AWS APIs?
97. How do you coordinate changes across subscriptions?
98. How do you coordinate changes across AWS accounts?
99. How do you implement blue-green deployment in PowerShell?
100. How do you implement health-gated rollback?
101. How do you orchestrate rolling Windows patching?
102. How do you prevent a fleet-wide outage during patching?
103. How do you automate certificate expiry remediation?
104. How do you validate backup and restore operations?
105. How do you design a disaster-recovery runbook script?
106. How do you emit metrics from a script?
107. How do you integrate logs with Azure Monitor or CloudWatch?
108. How do you trace a request across API calls?
109. How do you design a script for offline execution?
110. How do you support Windows PowerShell and PowerShell 7?
111. How do you test compatibility across PowerShell versions?
112. How do you manage module dependency locking?
113. How do you build a secure self-hosted runner?
114. How do you handle partial failure in parallel execution?
115. How do you make a script resumable?
116. How do you audit administrative actions?
117. How do you profile a slow PowerShell script?
118. How do you diagnose memory growth in a long-running runspace?
119. How do you design operational safety controls for destructive commands?
120. Design a secure, observable, cross-cloud PowerShell automation platform.

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
