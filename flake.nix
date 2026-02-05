{
  description = "Development environment with git, node, vscode, and Python/Jupyter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              nodejs
              vscode
              obsidian
            ];

            shellHook = ''
              echo "Development environment loaded!"
              echo "Available tools:"
              echo "  - git: $(git --version)"
              echo "  - node: $(node --version)"
              echo "  - vscode: code"
              echo "  - obsidian: obsidian"
            '';
          };

          python = pkgs.mkShell {
            buildInputs = with pkgs; [
              python312
              python312Packages.jupyterlab
              poetry
              nodejs
            ];

            shellHook = ''
              echo "🐍 Python/Jupyter shell loaded"
              echo "Available tools:"
              echo "  - python: $(python --version)"
              echo "  - poetry: $(poetry --version)"
              echo "  - jupyter lab: $(jupyter lab --version)"
              echo "  - node: $(node --version)"
            '';
          };
        };

        apps = {
          x86_64-linux = {
            all-desktop-apps = pkgs.stdenv.mkDerivation {
              name = "all-desktop-apps";
              buildInputs = [
                pkgs.google-chrome
                pkgs.slack
              ];
            };
          };
        };
      }
    );
}
