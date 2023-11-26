- The new option `system.switch.enable` was added. It is enabled by default.
  Disabling it makes the system unable to be reconfigured via `nixos-rebuild`.
  This is of advantage for image based appliances where updates are handled
  outside the image.
