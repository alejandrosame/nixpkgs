- `wrapHelm` exposes `passthru.pluginsDir` now which can be passed to
  `helmfile`. For convenience, a top-level package `helmfile-wrapped` has been
  added, which inherits `passthru.pluginsDir` from `kubernetes-helm-wrapped`.
  Refer to [PR #217768](https://github.com/NixOS/nixpkgs/issues/217768) for
  more details.
