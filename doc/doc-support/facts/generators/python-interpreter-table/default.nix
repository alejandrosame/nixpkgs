# NOTE: Alternatively, the drv can be simply the files,
# this would simplify the generation of the bash injector,
# but makes it hard to explore the facts.
{ lib
, stdenv
, writeScriptBin
# Configuration input
, id
}:
let
  inherit (lib.strings) readFile;
  contentFile = (./. + "/content.md");
in {
  drv = stdenv.mkDerivation {
    name = "FACT_${id}";
    src = ./.;
    phases = [ "installPhase" ];
    installPhase = ''
      dest="$out"
      mkdir -p "$dest"

      cp ${contentFile} $dest/${id}.md
    '';
  };
  target = "./languages-frameworks/python.section.md";
}
