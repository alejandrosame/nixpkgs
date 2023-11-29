#### Breaking changes {#sec-release-23.11-lib-breaking}

- [`lib.lists.foldl'`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.foldl-prime)
  now always evaluates the initial accumulator argument first.
  If you depend on the lazier behavior, consider using [`lib.lists.foldl`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.foldl)
  or [`builtins.foldl'`](https://nixos.org/manual/nix/stable/language/builtins.html#builtins-foldl') instead.
- [`lib.attrsets.foldlAttrs`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.attrsets.foldlAttrs)
  now always evaluates the initial accumulator argument first.
- Now that the internal NixOS transition to Markdown documentation is complete,
  `lib.options.literalDocBook` has been removed after deprecation in 22.11.
- `lib.types.string` is now fully deprecated and gives a warning when used.

#### Additions and improvements {#sec-release-23.11-lib-additions-improvements}

- [`lib.fileset`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-fileset):
  A new sub-library to select local files to use for sources,
  designed to be easy and safe to use.

  This aims to be a replacement for `lib.sources`-based filtering.
  To learn more about it, see [the blog post](https://www.tweag.io/blog/2023-11-28-file-sets/)
  or [the tutorial](https://nix.dev/tutorials/file-sets).

- [`lib.gvariant`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-gvariant):
  A partial and basic implementation of GVariant formatted strings.
  See [GVariant Format Strings](https://docs.gtk.org/glib/gvariant-format-strings.html) for details.

  :::{.warning}
  This API is not considered fully stable and it might therefore
  change in backwards incompatible ways without prior notice.
  :::

- [`lib.asserts`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-asserts): New function:
  [`assertEachOneOf`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.asserts.assertEachOneOf).
- [`lib.attrsets`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-attrsets): New function:
  [`attrsToList`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.attrsets.attrsToList).
- [`lib.customisation`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-customisation): New function:
  [`makeScopeWithSplicing'`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.customisation.makeScopeWithSplicing-prime).
- [`lib.fixedPoints`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-fixedPoints): Documentation improvements for
  [`lib.fixedPoints.fix`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.fixedPoints.fix).
- `lib.generators`: New functions:
  [`mkDconfKeyValue`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.generators.mkDconfKeyValue),
  [`toDconfINI`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.generators.toDconfINI).

  `lib.generators.toKeyValue` now supports the `indent` attribute in its first argument.
- [`lib.lists`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-lists): New functions:
  [`findFirstIndex`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.findFirstIndex),
  [`hasPrefix`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.hasPrefix),
  [`removePrefix`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.removePrefix),
  [`commonPrefix`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.commonPrefix),
  [`allUnique`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.allUnique).

  Documentation improvements for
  [`lib.lists.foldl'`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.lists.foldl-prime).
- [`lib.meta`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-meta): Documentation of functions now gets rendered
- [`lib.path`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-path): New functions:
  [`hasPrefix`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.path.hasPrefix),
  [`removePrefix`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.path.removePrefix),
  [`splitRoot`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.path.splitRoot),
  [`subpath.components`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.path.subpath.components).
- [`lib.strings`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-strings): New functions:
  [`replicate`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.strings.replicate),
  [`cmakeOptionType`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.strings.cmakeOptionType),
  [`cmakeBool`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.strings.cmakeBool),
  [`cmakeFeature`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.strings.cmakeFeature).
- [`lib.trivial`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-trivial): New function:
  [`mirrorFunctionArgs`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.trivial.mirrorFunctionArgs).
- `lib.systems`: New function:
  [`equals`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.systems.equals).
- [`lib.options`](https://nixos.org/manual/nixpkgs/unstable#sec-functions-library-options): Improved documentation for
  [`mkPackageOption`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.options.mkPackageOption).

  [`mkPackageOption`](https://nixos.org/manual/nixpkgs/unstable#function-library-lib.options.mkPackageOption).
  now also supports the `pkgsText` attribute.

Module system:
- Options in the `options` module argument now have the `declarationPositions` attribute
  containing the position where the option was declared:
  ```
  $ nix repl -f '<nixpkgs/nixos>'
  [...]
  nix-repl> :p options.environment.systemPackages.declarationPositions
  [ {
    column = 7;
    file = "/nix/store/vm9zf9wvfd628cchj0hdij1g4hzjrcz9-source/nixos/modules/config/system-path.nix";
    line = 62;
  } ]
  ```
  Not to be confused with `definitionsWithLocations`, which is the same but for option _definitions_.
- Improved error message for option declarations missing `mkOption`

#### Deprecations {#sec-release-23.11-lib-deprecations}

- `lib.meta.getExe pkg` (also available as `lib.getExe`) now gives a warning if `pkg.meta.mainProgram` is not set,
  but it continues to default to the derivation name.
  Nixpkgs accepts PRs that set `meta.mainProgram` on packages where it makes sense.
  Use `lib.getExe' pkg "some-command"` to avoid the warning and/or select a different executable.