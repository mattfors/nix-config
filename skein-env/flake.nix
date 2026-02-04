{
  description = "Skein-env: A portable developer machine bootstrap environment";

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
            # Version control
            git

            # Development tools
            nodejs
            docker  # Note: Docker CLI only, daemon must be installed separately
            kubectl
            maven
            jdk
            vscode  # Note: GUI application, may not work in headless environments

            # Common utilities
            curl
            wget
          ];

          shellHook = ''
            echo "🧶 Welcome to skein-env!"
            echo "Available tools:"
            echo "  - git: $(git --version)"
            echo "  - node: $(node --version)"
            echo "  - docker: $(docker --version 2>/dev/null || echo 'docker daemon not running')"
            echo "  - kubectl: $(kubectl version --client 2>/dev/null | head -n1 || echo 'kubectl installed')"
            echo "  - maven: $(mvn --version | head -n1)"
            echo "  - java: $(java -version 2>&1 | head -n1)"
            echo "  - vscode: $(code --version | head -n1)"
            echo ""
            echo "Environment ready for development!"
          '';
        };
      }
    );
}
