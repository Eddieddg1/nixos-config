{ config, ... }:

{
  services.searx = {
    enable = true;
    # environmentFile = "/home/eddie/.searxng.env";
    redisCreateLocally = true;
    configureUwsgi = true;

    uwsgiConfig = {
      socket = "/run/searx/searx.sock";
      http = ":8888";
      chmod-socket = "660";
    };

    limiterSettings = {
      real_ip = {
        x_for = 1;
        ipv4_prefix = 32;
        ipv6_prefix = 56;
      };

      botdetection = {
        ip_limit = {
          filter_link_local = true;
          link_token = true;
        };
      };
    };

    settings = {
      general = {
        debug = false;
      };

      server = {
        bind_address = "127.0.0.1";
        base_url = "https://search.venerablecreator.de/";
        port = 8888;
        # WARNING: setting secret_key here might expose it to the nix cache
        # see below for the sops or environment file instructions to prevent this
        secret_key = "FemboyLover69";
        limiter = true;
        method = "GET";
      };

      enabled_plugins = [
        "Basic Calculator"
        "Hash plugin"
        "Tor check plugin"
        "Open Access DOI rewrite"
        "Hostnames plugin"
        "Unit converter plugin"
        "Tracker URL remover"
      ];
    };
  };
}
