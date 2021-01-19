# Failing Check: System files with insecure permissions
Reason: Found system files with permissions that could put system at risk

## Why is this a problem?
Having sane permissions on system files limits the attack surface on your system in a scenario where you have malicious software running on your system.
It also helps prevent accidental breaking changes to these files.

## Required Action
Ensure the listed files have expected permissions
{{ range files }}
- file `{{ name }}` has insecure permissions, to fix: `{{ command }}`
{{ end }}
