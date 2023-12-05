# Bootstrapping Nixpkgs

The `minimal-bootstrap` package set contains the programs and utilities that make the Nipxkgs standard environment, `stdenv`, all started up using as much source code as possible.

The end goal of `minimal-bootstrap` is to provide a 1:1 replica of `bootstrap-tools`` and `busybox` as is used by `stdenv`. This will allow it to act as a drop-in substitute on platforms where we can support full source bootstrap.

```
TODO: double check this fact
It currently has a binay seed of 256-byte.
```

The `stdenv` constitutes a basic dependency for most packages defined in Nixpkgs. For this reason, it is prioritized on the bootstrapping efforts. Once settled, other compilers and languaguage utilities can be bootstrapped from the bootstrapped compilers in `stdenv`.

## Testing the bootstrapping chain

Currently, the bootstrapping chain only support the `i686-linux` architecture. These binaries can be used in as part of `x86_64-linux` bootrapping chains.

If you want to check that the bootstrapping chain works properly you can build run `tinycc` built with `GNU Meson` or `usl` with:

```
nix-build --system i686-linux . -A minimal-bootstrap.tinycc-mes
```

or

```
nix-build --system i686-linux . -A minimal-bootstrap.tinycc-musl
```

## Exploring the dependency graph

```
nix-store --query --graph $(nix-instantiate --system i686-linux . -A minimal-bootstrap.tinycc-mes)
```
