{pkgs ? import <nixpkgs> {}, ...}:
pkgs.mkShell {
  inputsFrom = [
    (pkgs.callPackage
      ./package.nix
      {})
  ];
  buildInputs = [
    pkgs.cargo
    pkgs.rustc
    pkgs.pkg-config
    pkgs.openssl.dev
    pkgs.nix
    pkgs.rust-src
    pkgs.rust-analyzer
  ];
  OPENSSL_DEV = pkgs.openssl.dev;
}
