{
  description = "ocaml shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          name = "ocaml";
          default = pkgs.mkShell {
            packages = with pkgs; [
              ocaml
              ocamlformat
              (with pkgs.ocamlPackages; [
                findlib
                dune_3
                odoc
                ocaml-lsp
                utop
              ])
            ];
          };
        }
      );
    };
}
