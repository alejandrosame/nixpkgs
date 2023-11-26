- The Yama LSM is now enabled by default in the kernel, which prevents ptracing non-child processes.
  This means you will not be able to attach gdb to an existing process, but will need to start that process from gdb (so it is a child).
  Or you can set `boot.kernel.sysctl."kernel.yama.ptrace_scope"` to 0.
