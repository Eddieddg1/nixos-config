{ config, lib, pkgs, ... }:

{
  imports = [ ./openvpn.nix ];
  networking = {
    hostName = "VenerableDesktop";
    networkmanager.enable = true;

    proxy = {
      # default = "https://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 80 443 ];
      allowedUDPPorts = [ 25565 80 443 ];
    };
  };
}
