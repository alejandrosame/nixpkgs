# Collect all facts into a derivation
# The derivation's output is a folder *facts* which contains markdown fragments to be
# inserted in the docs.
{ pkgs ? (import ./../../.. { }) }:
let
  inherit (pkgs) lib;
  inherit (lib.attrsets) foldlAttrs mapAttrsToList;
  inherit (lib.strings) concatStringsSep;
  inherit (lib.lists) map;

  # We expect each fact generator to be contained in a folder whose name is the *FACT-ID*.
  facts = foldlAttrs
    # TODO: Typecheck that all attrset values are "directory".
    #       Alternatively, ignore anything but directories.
    (acc: id: _:
      let
        fact = (pkgs.callPackage (./generators + "/${id}") { inherit id; });
      in
      {
        drvs = acc.drvs ++ [fact.drv];
        targets = acc.drvs ++ [{ inherit id; inherit (fact) target drv; }];
      })
    { drvs = []; targets = []; } # acc
    (builtins.readDir ./generators);
in {
  # This derivation allows contributors to easily debug locally by
  # running `nix-build . --attr collected` in this folder.
  collected = pkgs.symlinkJoin { name = "documentation-facts-collected"; paths = facts.drvs; };

  # Attribute to be used during the build phase of documentation rendering.
  # Check value with
  #   `nix-instantiate --eval --expr '(import ./. {})' --attr substituteFactsInPlacePrefix`
  substituteFactsInPlacePrefix = let
    file = fact: "${fact.drv.out}/${fact.id}.md";
    replacementString = fact: "<!-- FACT ${fact.id} -->";

    substituteInPlaceFact = fact: ''
      substituteInPlace \
        ${fact.target} \
        --replace-fail \
        "${replacementString fact}" \
        "$(cat ${(file fact)})"
    '';
  in
    concatStringsSep
      "\n"
      (map substituteInPlaceFact facts.targets);
}