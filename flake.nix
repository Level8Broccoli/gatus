{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      nixpkgs,
      utils,
      ...
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            go-tools
            vue-language-server
            nodejs-18_x
          ];
        };
      }
    );
}
