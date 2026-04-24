{ pkgs, inputs, system, flake, ... }:

let
  toolchain = inputs.fenix.packages.${system}.fromToolchainFile {
    file = flake + "/rust-toolchain.toml";
    sha256 = "sha256-gh/xTkxKHL4eiRXzWv8KP7vfjSk61Iq48x47BEDFgfk=";
  };

  craneLib = (inputs.crane.mkLib pkgs).overrideToolchain toolchain;

  src = craneLib.cleanCargoSource flake;

  commonArgs = {
    inherit src;
    strictDeps = true;
  };

  cargoArtifacts = craneLib.buildDepsOnly commonArgs;

  brightness-ctl-unwrapped = craneLib.buildPackage (commonArgs // {
    inherit cargoArtifacts;
    pname = "brightness-ctl";
  });
in
pkgs.symlinkJoin {
  name = "brightness-ctl-0.1.0";
  paths = [ brightness-ctl-unwrapped ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/brightness-ctl \
      --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.systemd
        pkgs.util-linux
        pkgs.libnotify
      ]}
  '';
}
