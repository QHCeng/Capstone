{
  description = "UW project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
        python = pkgs.python313;
      in {
        devShells = {
          # Impure workflow: uv manages the venv; nix supplies python + uv
          impure = pkgs.mkShell {
            packages = [
              python
              pkgs.uv
              pkgs.nodejs_22
              pkgs.libreoffice
              pkgs.git
            ];
            env =
              {
                # Prevent uv from downloading its own Python
                UV_PYTHON_DOWNLOADS = "never";
                # Force uv to use nixpkgs Python
                UV_PYTHON = python.interpreter;
              }
              // lib.optionalAttrs pkgs.stdenv.isLinux {
                # Help manylinux wheels find system libs
                LD_LIBRARY_PATH = lib.makeLibraryPath pkgs.pythonManylinuxPackages.manylinux1;
              };
            shellHook = ''
              unset PYTHONPATH

              # Ensure a local virtualenv exists and is up to date so `python` just works
              if [ ! -d .venv ]; then
                echo "[devShell:impure] Creating .venv with uv (python=$UV_PYTHON)" >&2
                uv venv
              fi

              # Sync dependencies from lock (fast if already up-to-date)
              if [ -f uv.lock ]; then
                echo "[devShell:impure] Syncing dependencies from uv.lock" >&2
                uv sync || true
              else
                echo "[devShell:impure] No uv.lock found, creating one and syncing" >&2
                uv lock || true
                uv sync || true
              fi

              # Activate the venv by putting it first on PATH
              export VIRTUAL_ENV="$PWD/.venv"
              export PATH="$VIRTUAL_ENV/bin:$PATH"

              # Optional: convenience aliases
              alias pip="uv pip"
              exec zsh
            '';
          };
        };
      }
    );
}
