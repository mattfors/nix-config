# nix-config

A reproducible development environment using Nix that works on both Linux and macOS.

## What's Included

This environment provides:
- **git**: Version control system
- **node**: Node.js runtime and npm
- **vscode**: Visual Studio Code editor (requires a graphical environment)

## Prerequisites

You need to have Nix installed on your system:

### Installing Nix

#### For Linux and macOS:
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

#### For macOS (alternative):
```bash
sh <(curl -L https://nixos.org/nix/install)
```

After installation, restart your terminal.

## Usage

### Enter the development environment:

```bash
nix develop
```

This will:
1. Download and set up all required packages
2. Drop you into a shell with git, node, and vscode available
3. Display the versions of installed tools

### Run a command in the environment:

```bash
nix develop -c node --version
nix develop -c git --version
```

### Use with direnv (optional):

If you have `direnv` installed, create a `.envrc` file:

```bash
echo "use flake" > .envrc
direnv allow
```

Now the environment will automatically load when you enter the directory.

## Troubleshooting

### Enable flakes (if not already enabled):

If you get an error about experimental features, enable flakes:

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### First time setup:

The first time you run `nix develop`, it will:
- Create a `flake.lock` file to pin dependencies
- Download packages (this may take a few minutes)
- Subsequent runs will be much faster

## Platform Support

This configuration works on:
- Linux (x86_64, aarch64)
- macOS (x86_64, aarch64/M1/M2)
- WSL2 on Windows (via Linux)