- GNOME, Pantheon, Cinnamon modules no longer force Qt applications to use Adwaita style. This implemantion  was buggy and is no longer maintained upstream. Specifically, Cinnamon defaults to the gtk2 style instead now, following the default in Linux Mint). If you still want Adwaita used, you may add the following options to your configuration. Please be aware, that it will probably be removed eventually.

  ```nix
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
  ```
