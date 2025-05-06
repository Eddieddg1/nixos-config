{ config, lib, pkgs, ... }:

{
  imports = [ ./openvpn.nix ];
  networking = {
    hostName = "VenerableCreator";
    networkmanager.enable = true;

    proxy = {
      # default = "https://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 31975 53 ];
      allowedUDPPorts = [ 31975 53 ];
    };
  };
}
