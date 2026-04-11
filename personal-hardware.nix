{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd = {
      kernelModules = [ "bcache" ];
    };

    kernelParams = [
      "drm.edid_firmware=DP-2:edid/1920x1080.bin"
      "video=DP-2:1920x1080@60"
    ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    swraid = { 
      enable = true;
      mdadmConf = ''
        MAILADDR root
      '';
    };

    kernelPackages = pkgs.linuxPackages_latest;

    supportedFilesystems = [ "bcache" ];
  };

  fileSystems."/home/storage" =
    { device = "/dev/disk/by-uuid/926e8381-9132-49af-83c7-2b27ef4b2158";
      fsType = "xfs";
    };

  fileSystems."/home/long" =
    { device = "/dev/disk/by-uuid/b3b3da3a-bc45-42a2-90a8-fe43d301fb30";
      fsType = "xfs";
    };
}
