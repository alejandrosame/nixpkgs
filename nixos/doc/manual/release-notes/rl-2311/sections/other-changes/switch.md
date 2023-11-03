- A new option `system.switch.enable` was added. By default, this is option is
  enabled. Disabling it makes the system unable to be reconfigured via
  `nixos-rebuild`. This is good for image based appliances where updates are
  handled outside the image.
