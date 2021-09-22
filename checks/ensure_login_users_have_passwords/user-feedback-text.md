# Failing Check: Passwordless "loginable" accounts
Reason: There are accounts on your system that can be used to log in with, without a password set.

## Why is this a Problem?
All accounts must have passwords or be locked to prevent the account from being used by an unauthorized user.

Further reading can be found at CIS Ubuntu 18.04 Benchmark v2.0.1, section 6.2.1.

## Required Action
1. If the user must be possible to log in with:
	- Run: `sudo passwd {{ username }}`
1. If that's not strictly necessary:
	- `sudo chsh -s "$(find / -maxdepth 3 -type f -name nologin 2>/dev/null)" {{ username }} && sudo usermod -l {{ username }}`
