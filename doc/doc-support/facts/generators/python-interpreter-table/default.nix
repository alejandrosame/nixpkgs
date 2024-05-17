{ lib
, stdenv
, writeScriptBin
# Configuration input
, outDir ? "facts"
, factID
}:
let
  inherit (lib.strings) readFile;
  contentFile = (./. + "/content.md");
in stdenv.mkDerivation {
  name = "FACT_${factID}";
  src = ./.;
  phases = [ "installPhase" ];
  installPhase = ''
    dest="$out/${outDir}"
    mkdir -p "$dest"

    cp ${contentFile} $dest/${factID}.md
  '';
}
