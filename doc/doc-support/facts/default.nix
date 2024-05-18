# Collect all facts into a derivation
# The derivation's output is a folder *facts* which contains markdown fragments to be
# inserted in the docs.
{ pkgs ? (import ./../../.. { }) }:
let
  inherit (pkgs) lib;
  inherit (lib.attrsets) foldlAttrs mapAttrsToList;
  inherit (lib.strings) concatStringsSep;
  inherit (lib.lists) map;

  renderFact = { id }: (pkgs.callPackage (./generators + "/${id}") { inherit id; });

  # We expect each fact generator to be contained in a folder whose name is the *FACT-ID*.
  facts = foldlAttrs
    # TODO: Typecheck that all attrset values are "directory".
    #       Alternatively, ignore anything but directories.
    (acc: id: _:
      let fact = renderFact { inherit id; } // { inherit id; };
      in acc ++ [ fact ])
    [ ]
    (builtins.readDir ./generators);
in {
  # Convenience function to render an individual fact.
  # Call with:
  #   `nix-build --expr '(import ./. {}).renderFact' --argstr "id" "<FACT-ID>"`
  # Example:
  #   `nix-build --expr '(import ./. {}).renderFact' --argstr "id" "python-interpreter-table"`
  inherit renderFact;

  # Convenience derivation to check the rendering the collection of rendered facts.
  # Call with:
  #    `nix-build . --attr collected-facts`.
  # The files are collected via `pkgs.runCommand` because `pkgs.symlinkJoin` only works with folders
  collected-facts = let
    symlinkFn = fact: "ln -s ${fact.drv} $out/${fact.id}.md";
  in
    pkgs.runCommand "collected-facts" { }
      (concatStringsSep
        "\n"
        (["mkdir $out"] ++ (map symlinkFn facts)));

  # Attribute to be used during the build phase of documentation rendering.
  # Call with:
  #   `nix-instantiate --eval --expr '(import ./. {})' --attr substituteFactsInPlacePrefix`
  substituteFactsInPlacePrefix = let
    replacementString = fact: "<!-- FACT ${fact.id} -->";

    substituteInPlaceFactFn = fact: ''
      substituteInPlace \
        ${fact.target} \
        --replace-fail \
        "${replacementString fact}" \
        "$(cat ${fact.drv})"
    '';
  in
    concatStringsSep
      "\n"
      (map substituteInPlaceFactFn facts);
}