{ config, pkgs, ... }:
{
  imports = [
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
    })).nixosModules.nixvim
    ./configuration.nix
  ];
}
