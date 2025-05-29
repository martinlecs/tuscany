if command -v docker >/dev/null 2>&1; then
    case "$(uname -s)" in
    Linux) if [ -n "$WSL_DISTRO_NAME" ]; then
        curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
    else
        curl -L https://nixos.org/nix/install | sh -s -- --daemon
    fi ;;
    Darwin) curl -L https://nixos.org/nix/install | sh ;;
    *)
        echo "Environment not supported."
        exit 1
        ;;
    esac
fi

# https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/applications/networking/cluster/helmfile/default.nix#L50
# https://nix.dev/guides/recipes/sharing-dependencies
