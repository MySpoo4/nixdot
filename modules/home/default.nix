# contain some function to collect modules into attribute set
# key - file name
# val - file path
let
  buildAttrSet =
    path:
    let
      entries = builtins.readDir path;
      dirNames = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);
    in
    dirNames;
in
buildAttrSet ./.
