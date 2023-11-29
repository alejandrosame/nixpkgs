- `services.fail2ban.jails` can be configured with attribute sets now, defining
  settings and filters instead of lines. The stringed options `daemonConfig`
  and `extraSettings` have respectively been replaced by `daemonSettings` and
  `jails.DEFAULT.settings`. Those  use attribute sets.
