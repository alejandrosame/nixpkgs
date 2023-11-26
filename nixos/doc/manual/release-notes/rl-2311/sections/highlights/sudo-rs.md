- [`sudo-rs`], a reimplementation of `sudo` in Rust, is now supported.
  An experimental new module `security.sudo-rs` was added.
  Switching to it (via ` security.sudo-rs.enable = true;`) introduces
  slight changes in sudo behaviour, due to `sudo-rs`' current limitations:
  - terminfo-related environment variables aren't preserved for `root` and `wheel`;
  - `root` and `wheel` are not given the ability to set (or preserve)
    arbitrary environment variables.

  **Note:** The `sudo-rs` module only takes configuration through `security.sudo-rs`,
  and in particular does not automatically use previously-set rules; this could be
  achieved with `security.sudo-rs.extraRules = security.sudo.extraRules;` for instance.

[`sudo-rs`]: https://github.com/memorysafety/sudo-rs/
