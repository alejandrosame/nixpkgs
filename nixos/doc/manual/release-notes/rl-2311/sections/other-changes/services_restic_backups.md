- `services.restic.backups` adds wrapper scripts to your system path now. This
  wrapper script sets the same environment variables as the service, so restic
  operations can easily be run from the command line. This behavior can be
  disabled by setting `createWrapper` to `false`, for each backup
  configuration.
