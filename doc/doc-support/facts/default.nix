# Collect all facts into a derivation
# The derivation's output is a folder *facts* which contains markdown fragments to be
# inserted in the docs.
{ pkgs ? (import ./../../.. { }),
  factsDir ? "facts",
}:
let
  inherit (pkgs) lib;
  inherit (lib.attrsets) mapAttrs mapAttrsToList;

  factList = let
    # We expect each fact generator to be contained in a folder whose name is the *FACTID*.
    factAttrs = mapAttrs
      # TODO: Typecheck that all attrset values are "directory"
      (factID: _: (pkgs.callPackage (./generators + "/${factID}") { inherit factsDir factID; }))
      (builtins.readDir ./generators);
  in
  mapAttrsToList
    (_: value: value)
    factAttrs;

in pkgs.symlinkJoin { name = "documentation-facts"; paths = factList; }