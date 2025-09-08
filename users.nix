{ pkgs, ... }:

{
  # Don't forget password with passwd!
  users.users.eddie = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "libvirtd" ];
    packages = with pkgs; [
      tree
    ];
  };
}
