{ pkgs, ... }:

{
  services = {
    desktopManager = {
      plasma6.enable = true;
    };

    # printing.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "se";
        variant = "us";
      };
    };

    flatpak.enable = true;

    murmur = {
      allowHtml = false;
      autobanAttempts = 3;
      autobanTime = 86400;
      autobanTimeframe = 120;
      bandwidth = 510000;
      bonjour = false;
      clientCertRequired = false;
      enable = true;
      imgMsgLength = 4096;
      logDays = 28;
      registerName = "FUCK YOU!";
      sendVersion = true;
      textMsgLength = 4096;
      users = 100;
      welcometext = "Welcome!";
      password = "$MURMURD_PASSWORD";
      environmentFile = "/etc/nixos/secrets/murmur.env";
      openFirewall = true;
    };

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
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
