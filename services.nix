{ pkgs, config, ... }:

{
  services = {
    desktopManager = {
      plasma6.enable = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "se";
        variant = "us";
      };
    };

    flatpak.enable = true;

    hardware.openrgb = { 
      enable = true; 
      package = pkgs.openrgb-with-all-plugins; 
      motherboard = "amd"; 
      server.port = 6742; 
    };

    murmur = {
      allowHtml = false;
      autobanAttempts = 3;
      autobanTime = 86400;
      autobanTimeframe = 120;
      bandwidth = 510000;
      bonjour = false;
      clientCertRequired = false;
      enable = false;
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

    nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts = {
        "search.venerablecreator.de" = {
          forceSSL = true;
          useACMEHost = "search.venerablecreator.de";
          acmeRoot = config.security.acme.defaults.webroot;

          locations = {
            "/" = {
              extraConfig = ''
                auth_basic "Restricted";
                auth_basic_user_file "/etc/nginx/searx.htpasswd";

                include ${pkgs.nginx}/conf/uwsgi_params;
                uwsgi_pass unix:/run/searx/searx.sock;

                uwsgi_param HTTP_HOST $host;
                uwsgi_param HTTP_CONNECTION $http_connection;
                uwsgi_param HTTP_X_FORWARDED_PROTO $scheme;
                uwsgi_param HTTP_X_REAL_IP $remote_addr;
                uwsgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;

              '';
            };
          };
        };
      };
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
