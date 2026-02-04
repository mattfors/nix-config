{
  description = "Development environment with git, node, and vscode";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            git
            nodejs
            vscode
          ];

          shellHook = ''
            echo "Development environment loaded!"
            echo "Available tools:"
            echo "  - git: $(git --version)"
            echo "  - node: $(node --version)"
            echo "  - vscode: vscode available as 'code' command"
          '';
        };
      }
    );
}
