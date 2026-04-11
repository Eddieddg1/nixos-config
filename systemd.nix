{ pkgs, config, lib, ... }:

{
  systemd = {
    packages = with pkgs; [
      lact
    ];
    
    services = {
      lactd.wantedBy = ["multi-user.target"];

      nginx.serviceConfig.ProtectHome = false;
    };
  };
}
