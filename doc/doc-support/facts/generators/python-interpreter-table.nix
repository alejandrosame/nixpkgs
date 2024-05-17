{ pkgs ? (import ./../../../.. { }),
  factsDir ? "facts",
  factID ? "python-interpreter-table",
  fact-generator ? (let
                    inherit (pkgs.lib.strings) readFile;
                    content = readFile (./. + "/${factID}.md");
                  in 
                    pkgs.writeScriptBin "fact-generator" ''
                      cat <<EOF
                      ${content}
                      EOF
                    '')
}:
let
  inherit (pkgs) lib;
  

  #factID = "python-interpreter-table";
  #content = readFile (./. + "/${factID}.md");

  ##Check: Generation function can be done with runCommand
  #fact-generator = pkgs.writeScriptBin "fact-generator" ''
  #  cat <<EOF
  #  ${content}
  #  EOF
  #'';

in pkgs.stdenv.mkDerivation {
  name = "fact-${factID}";

  nativeBuildInputs = with pkgs; [
    fact-generator
  ];

  src = ./.;

  buildPhase = ''
    dest="out/${factsDir}"
    mkdir -p "$dest"

    fact-generator > $dest/${factID}.md
  '';

  installPhase = ''
    mv out $out
  '';
}
