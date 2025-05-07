# Edit this configuration file to define what should be installed on your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./systemd.nix
      ./networking.nix
      ./users.nix
      ./services.nix
      ./nixvim/nixvim.nix
      ./dotfiles.nix
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

  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "se";
    useXkbConfig = true; # use xkb.options in tty.
  };

  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    brave
    qutebrowser
    mpd
    cantata
    vesktop
    kdePackages.kate
    kdePackages.dolphin
    alacritty
    vlc
    wineWowPackages.stable
    winetricks
    protontricks
    xorg.xorgserver
    xorg.xf86inputlibinput
    xorg.xinit
    w3m
    fastfetch
    htop
    mangohud
    gcc
    zip
    unzip
    unrar
    p7zip
    pavucontrol
    qbittorrent
    tor-browser
    file
    spotify
    appimage-run
    python3
    libreoffice
    nasm
    lutris
    qemu
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    rofi
    rofi-mpd
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
  system.stateVersion = "24.11"; # Did you read the comment?

}

