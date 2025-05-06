{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb.layout = "se";

      windowManager = {
        awesome.enable = true;
        i3 = {
          enable = true;
          extraPackages = with pkgs; [
            i3status
            i3lock
          ];
        }; 
      };
    };

    desktopManager = {
      plasma6.enable = true;
    };

    # printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    openssh.enable = true;

    udev = { 
      packages = [
        (pkgs.writeTextFile {
          name = "70-wooting.rules";
          text = ''
            SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", TAG+="uaccess"
            SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", TAG+="uaccess"
          '';
          destination = "/etc/udev/rules.d/70-wooting.rules";
        })
      ];
    };
  };
}
