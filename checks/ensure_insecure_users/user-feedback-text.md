# Failing Check: Insecured system accounts
Reason: There are a number of accounts provided with most distributions that are used to manage applications and are not intended to provide an interactive shell.

## Why is this a Problem?
It is important to make sure that accounts that are not being used by regular users are prevented from being used to provide an interactive shell. By default, most distributions set the password field for these accounts to an invalid string, but it is also recommended that the shell field in the password file be set to the `/usr/sbin/nologin` shell. This prevents the account from potentially being used to run any commands.

Further reading can be found at CIS Ubuntu 18.04 Benchmark v2.0.1, section 5.4.

## Required Action
The following users must have their associated login shells set to `/usr/sbin/nologin` in order to be considered secure:
{{ range user\_login\_shells }}
- Run: `sudo chsh -s /usr/sbin/nologin {{ username }}`
{{ end }}