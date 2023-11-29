- There is a new NixOS option when writing NixOS tests
  `testing.initrdBackdoor`, that enables `backdoor.service` in initrd. Requires
  `boot.initrd.systemd.enable` to be enabled. Boot will pause in Stage 1 at
  `initrd.target`, and will listen for commands from the `Machine` python
  interface, just like Stage 2 normally does. This enables commands to be sent
  to test and debug Stage 1. Use `machine.switch_root()` to leave Stage 1 and
  proceed to Stage 2.
