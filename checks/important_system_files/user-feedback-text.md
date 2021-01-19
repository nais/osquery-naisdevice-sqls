# Failing Check: System files with insufficient security permissions
Reason: System files found with insufficient security permissions (execution bits, file owner, file group) that could put system at risk.

## Why is this a problem?
Sufficient security permissions on specific system files limits the attack surface on your system for potential security risks - such as in a scenario where you'd have malicious software running on your system.
This also helps prevent your non-root users from accidentally introducing breaking changes to these files.

## Required Action
The following files must have the minimum security permissions / correct group&owner IDs set:
{{ range files }}
- file `{{ name }}` has insecure permissions, to fix: `{{ command }}`
{{ end }}
