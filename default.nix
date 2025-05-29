{ pkgs ? import <nixpkgs> {} }:

let
  platform = pkgs.stdenv.hostPlatform.system;

  inherit (pkgs.lib) throw;

  binaryInfo = {
    "x86_64-linux" = {
      arch = "x86_64";
      os = "linux";
      Os = "Linux";
      sha256 = "ad62e7d73cab004d4968fbb8d599983198dbc3cea4fcd21055f7565c3268e805";
    };
    "aarch64-darwin" = {
      arch = "arm64";
      os = "darwin";
      Os = "Darwin";
      sha256 = "1964dd8f544f0b0bf837f843ff82309a39db3bebca3d6f9075fa85b17b53187e";
    };
    "x86_64-darwin" = {
      arch = "x86_64";
      os = "darwin";
      Os = "Darwin";
      sha256 = "e96053d5a08e8f55bc1ad1bda3d27101129472d186f0c7c6cd1a690d59feddf2";
    };
  };

  bin = binaryInfo.${platform} or (throw "Unsupported platform: ${platform}");

  kubectl-ai = pkgs.stdenv.mkDerivation rec {
    pname = "kubectl-ai";
    version = "0.0.10";

    src = pkgs.fetchurl {
      url = "https://github.com/GoogleCloudPlatform/${pname}/releases/download/v${version}/${pname}_${bin.Os}_${bin.arch}.tar.gz";
      sha256 = bin.sha256;
    };

    phases = [ "installPhase" ];

    installPhase = ''
      tar --no-same-owner -xzf $src ${pname}
      install -D -m 0755 ${pname} -t $out/bin
    '';

    meta = with pkgs.lib; {
      description = "AI powered Kubernetes Assistant";
      homepage = "https://github.com/GoogleCloudPlatform/kubectl-ai";
    };
  };
in
kubectl-ai