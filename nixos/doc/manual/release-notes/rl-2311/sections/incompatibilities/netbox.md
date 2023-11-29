- `netbox` was updated to v3.6. `services.netbox.package` still defaults
  to v3.5 if `stateVersion` is earlier than 23.11. Refer to upstream's breaking
  changes [for
  v3.6.0](https://github.com/netbox-community/netbox/releases/tag/v3.6.0) and
  upgrade NetBox by changing `services.netbox.package`. Database migrations
  will be run automatically.
