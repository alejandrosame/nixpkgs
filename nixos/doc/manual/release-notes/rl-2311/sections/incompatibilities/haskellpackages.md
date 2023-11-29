- The following packages in `haskellPackages` have a separate bin output now:
  `cabal-fmt`, `calligraphy`, `eventlog2html`, `ghc-debug-brick`, `hindent`,
  `nixfmt`, `releaser`. This means you need to replace e.g.
  `"${pkgs.haskellPackages.nixfmt}/bin/nixfmt"` with `"${lib.getBin
  pkgs.haskellPackages.nixfmt}/bin/nixfmt"` or `"${lib.getExe
  pkgs.haskellPackages.nixfmt}"`. The binaries also won’t be in scope if you
  rely on them being installed e.g. via `ghcWithPackages`.
  `environment.packages` picks the `bin` output automatically, so for normal
  installation no intervention is required. Also, toplevel attributes like
  `pkgs.nixfmt` are not impacted negatively by this change.
