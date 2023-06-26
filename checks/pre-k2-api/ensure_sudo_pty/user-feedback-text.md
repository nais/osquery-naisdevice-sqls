# Failing Check: Insecure sudoers configuration
Reason: Inadequately secure configuration of sudoers

## Why is this a Problem?
Attackers can run a malicious program using sudo, which would again fork a background process that remains even when the main program has finished executing.

Further reading can be found at CIS Ubuntu 18.04 Benchmark v2.0.1, section 1.3.2.

## Required Action
1. `sudo visudo`.
   (Tip: use `-E` between the two commands so as to open in your specified `$EDITOR`).
2. Add the following to an empty line: `Defaults use_pty`.
3. Save and exit.
4. Remove all lines including the substring `!use_pty` from all files recursively in `/etc/sudoers*`.
