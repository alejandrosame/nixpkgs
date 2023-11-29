- The `services.sslh` module has been updated to follow [RFC
  0042](https://github.com/NixOS/rfcs/blob/master/rfcs/0042-config-option.md).
  As such, several options have been moved to the freeform attribute set
  [services.sslh.settings](#opt-services.sslh.settings), which allows to change
  any of the settings in {manpage}`sslh(8)`.

  In addition, the newly added option
  [services.sslh.method](#opt-services.sslh.method) allows to switch between
  the {manpage}`fork(2)`, {manpage}`select(2)` and `libev`-based connection
  handling method. Refer to the [sslh
  docs](https://github.com/yrutschle/sslh/blob/master/doc/INSTALL.md#binaries)
  for a comparison.
