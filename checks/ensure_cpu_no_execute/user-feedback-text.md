# Failing Check: No Execute Enabled
Reason: No NX/XD feature detected

## Why is this a Problem?
Recent processors in the x86 family support the ability to prevent code execution on a per memory page basis.
Generically and on AMD processors, this ability is called No Execute (NX), while on Intel processors it is called Execute Disable (XD).
This ability can help prevent exploitation of buffer overflow vulnerabilities and should be activated whenever possible.

This addresses: CIS Ubuntu 18.04 Benchmark v2.0.1, section 1.6.1.

## Required Action
You need to enable NX or XD support in your BIOS.
