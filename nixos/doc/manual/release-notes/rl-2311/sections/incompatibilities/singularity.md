- Apptainer/Singularity defaults to using `"$out/var/lib"` for the
  `LOCALSTATEDIR` configuration option instead of the top-level `"/var/lib"`
  now. This change impacts the `SESSIONDIR` (container-run-time mount point)
  configuration, which is set to `$LOCALSTATEDIR/<apptainer or
  singularity>/mnt/session`. This detaches the packages from the top-level
  directory, rendering the NixOS module optional.

  The default behavior of the NixOS module `programs.singularity` stays
  unchanged. We add a new option
  `programs.singularity.enableExternalSysConfDir` (default to `true`) to
  specify whether to set the top-level `"/var/lib"` as `LOCALSTATEDIR` or not.
