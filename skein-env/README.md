# Skein-env 🧶

A portable developer machine bootstrap environment using Nix flakes.

## Overview

Skein-env provides a reproducible development environment with common development tools, making it easy to bootstrap a developer machine on macOS and Linux.

## Included Tools

- **git**: Version control system
- **nodejs**: JavaScript runtime
- **docker**: Container platform
- **kubectl**: Kubernetes command-line tool
- **maven**: Build automation tool for Java
- **jdk**: Java Development Kit
- **vscode**: Visual Studio Code editor
- **curl/wget**: HTTP utilities

## Prerequisites

- Nix package manager with flakes enabled
  - To enable flakes, add to `~/.config/nix/nix.conf`:
    ```
    experimental-features = nix-command flakes
    ```

## Usage

### Enter the development environment

```bash
cd skein-env
nix develop
```

### Use without cloning

You can also use this environment directly from GitHub:

```bash
nix develop github:mattfors/nix-config?dir=skein-env
```

### Build the environment

```bash
nix build .#devShells.x86_64-linux.default
```

## Platform Support

- ✅ Linux (x86_64, aarch64)
- ✅ macOS (x86_64, aarch64)

## Customization

To add more tools, edit `flake.nix` and add packages to the `buildInputs` list:

```nix
buildInputs = with pkgs; [
  git
  nodejs
  # Add your tools here
];
```

## License

This is free and unencumbered software released into the public domain.
