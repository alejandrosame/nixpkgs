- `security.sudo` provides two extra options now, while not changing the
  module's default behaviour:
  - `defaultOptions` controls the options used for the default rules;
  - `keepTerminfo` controls whether `TERMINFO` and `TERMINFO_DIRS` are preserved
    for `root` and the `wheel` group.
