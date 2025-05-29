let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/72841a4a8761d1aed92ef6169a636872c986c76d";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  kubectl-ai = import ./default.nix { inherit pkgs; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    kind
    kubectl
    kubernetes-helm
    kubectl-ai
    caddy
  ];
}