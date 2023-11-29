{
  rl-filename = "rl-2311.section.md";
  title = "# Release 23.11 (“Tapir”, 2023.11/??) {#sec-release-23.11}";
  sections = [
    #rec {
    #  id = "highlights";
    #  title = "## Highlights {#sec-release-23.11-highlights}";
    #  meta = import (./. + "/${id}.nix");
    #}
    rec {
      id = "intro";
      title = "";
      meta = import (./. + "/${id}.nix");
    }
    rec {
      id = "toc";
      title = "## Table of contents {#sec-release-23.11-toc}";
      meta = import (./. + "/${id}.nix");
    }
    rec {
      id = "header";
      title = "## NixOS {#sec-release-23.11-nixos}";
      meta = [];
    }
    rec {
      id = "incompatibilities";
      title = "### Breaking Changes {#sec-release-23.11-nixos-breaking-changes}";
      meta = import (./. + "/${id}.nix");
    }
    rec {
      id = "new-services";
      title = "### New Services {#sec-release-23.11-nixos-new-services}";
      meta = import (./. + "/${id}.nix");
    }
    rec {
      id = "other-changes";
      title = "### Other Notable Changes {#sec-release-23.11-nixos-notable-changes}";
      meta = import (./. + "/${id}.nix");
    }
    rec {
      id = "header";
      title = "## nixpkgs {#sec-release-23.11-nixpkgs}";
      meta = [];
    }
    rec {
      id = "nixpkgs-lib";
      title = "### Nixpkgs library changes {#sec-release-23.11-nixpkgs-lib}";
      meta = import (./. + "/${id}.nix");
    }
    rec {
      id = "nixpkgs-internals";
      title = "### Nixpkgs internals {#sec-release-23.11-nixpkgs-internals}";
      meta = import (./. + "/${id}.nix");
    }
  ];
}
