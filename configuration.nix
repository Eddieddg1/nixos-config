# Edit this configuration file to define what should be installed on your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./networking.nix
      ./users.nix
      ./services.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    steam.enable = true;
    mtr.enable = true;
    dconf.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "drm.edid_firmware=DP-2:edid/1920x1080.bin"
      "video=DP-2:1920x1080@60"
    ];
  };

  time.timeZone = "Europe/Stockholm";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "sv-latin1";
    useXkbConfig = true; # use xkb.options in tty.
  };

  security = {
    rtkit.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    alacritty
    blender-hip
    brave
    btop
    cantata
    eza
    fastfetch
    ffmpeg
    fluffychat
    gimp
    git
    htop
    hunspell
    hunspellDicts.en_US
    hyphenDicts.en_US
    jdk25
    libreoffice-fresh
    lutris
    mangohud
    mpd
    mumble
    nasm
    nemo
    obsidian
    odin
    pavucontrol
    prismlauncher
    protontricks
    p7zip
    qbittorrent
    kdePackages.qtbase
    kdePackages.qtmultimedia
    spotify
    unrar
    unzip
    vesktop
    vim
    wget
    winetricks
    wineWowPackages.stable
    zip
    zoxide
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

