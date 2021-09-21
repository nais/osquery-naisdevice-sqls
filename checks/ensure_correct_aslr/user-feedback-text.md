# Failing Check: Address space layout randomization is not enabled
Reason: Kernel flag `randomize_va_space` is not set to 2

## Why is this a Problem?
Address space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space of key data areas of a process.

Randomly placing virtual memory regions will make it difficult to write memory page exploits as the memory placement will be consistently shifting.

## Required Action
Run the following commands in a terminal:
```
sudo sh -c 'echo "kernel.randomize_va_space = 2" > /etc/sysctl.d/10-enable-aslr.conf'
sudo sysctl -w kernel.randomize_va_space=2
```