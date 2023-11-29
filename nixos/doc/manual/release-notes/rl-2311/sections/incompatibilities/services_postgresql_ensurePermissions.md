- `services.postgresql.ensurePermissions` has been deprecated in favor of
  `services.postgresql.ensureUsers.*.ensureDBOwnership` which simplifies the
  setup of database owned by a certain system user in local database contexts
  (which make use of peer authentication via UNIX sockets), migration
  guidelines were provided in the NixOS manual, please refer to them if you are
  affected by a PostgreSQL 15 changing the way `GRANT ALL PRIVILEGES` is
  working. `services.postgresql.ensurePermissions` will be removed in 24.05.
  All NixOS modules were migrated using one of the strategy, e.g.
  `ensureDBOwnership` or `postStart`. Refer to the [PR
  #266270](https://github.com/NixOS/nixpkgs/pull/266270) for more details.
