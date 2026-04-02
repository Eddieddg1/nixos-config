{ pkgs, ... }:

{
  # Don't forget password with passwd!
  users.users = {
    eddie = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "libvirtd" "networkmanager" "input" "audio" ];
      packages = with pkgs; [
        tree
      ];
    };
  };
}
