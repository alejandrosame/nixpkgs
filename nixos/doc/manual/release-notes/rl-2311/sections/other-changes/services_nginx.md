- The `services.nginx` module gained a `defaultListen` option at server-level
  with support for PROXY protocol listeners. Also `proxyProtocol` is exposed in
  the `services.nginx.virtualHosts.<name>.listen` option now. This it is
  possible to run PROXY listeners and non-PROXY listeners at a server-level.
  Refer to [PR #213510](https://github.com/NixOS/nixpkgs/pull/213510/) for more
  details.
