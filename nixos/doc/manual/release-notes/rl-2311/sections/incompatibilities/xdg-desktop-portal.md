- xdg-desktop-portal has been updated to 1.18, which reworked how portal
  implementations are selected. If you roll your own desktop environment, you
  should either set `xdg.portal.config` or `xdg.portal.configPackages`, which
  allow fine-grained control over which portal backend to use for specific
  interfaces, as described in {manpage}`portals.conf(5)`.

  If you don't provide configurations, a portal backend will only be considered
  when the desktop you use matches its deprecated `UseIn` key. While some NixOS
  desktop modules should already ship one for you, it is suggested to test
  portal availability by trying [Door
  Knocker](https://flathub.org/apps/xyz.tytanium.DoorKnocker) and [ASHPD
  Demo](https://flathub.org/apps/com.belmoussaoui.ashpd.demo). If things
  regressed, you may run `G_MESSAGES_DEBUG=all
  /path/to/xdg-desktop-portal/libexec/xdg-desktop-portal` for ideas on which
  config file and which portals are chosen.
