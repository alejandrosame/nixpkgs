# NOTE: Alternatively, the drv can be simply the files,
# this would simplify the generation of the bash injector,
# but makes it hard to explore the facts.
{ lib
, runCommand
# Configuration input
, id
}:
let
  contentFile = (./. + "/content.md");
in {
  drv = runCommand "FACT_${id}.md" { inherit contentFile; } ''
    cp $contentFile $out
  '';
  target = "./languages-frameworks/python.section.md";
}
