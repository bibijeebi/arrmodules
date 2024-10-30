{
  outputs = {self, ...}: {
    nixosModules.default = import ./services/radarr/nixos-module.nix;
  };
}
