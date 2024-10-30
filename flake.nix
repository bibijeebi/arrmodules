{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosModules.default = import ./services/radarr/nixos-module.nix;
  };
}
