{ config, lib, pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia-container-toolkit.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      nvidiaSettings = true;
      forceFullCompositionPipeline = true;
    };
  };
}
