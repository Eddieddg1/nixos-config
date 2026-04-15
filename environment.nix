{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      adwaita-icon-theme
      alacritty
      font-awesome
      bash-completion
      bcache-tools
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
      jdk8_headless
      kdePackages.qtbase
      kdePackages.qtmultimedia
      krita
      lact
      libreoffice-fresh
      librewolf
      lmstudio
      lutris
      mangohud
      mdadm
      mpd
      mumble
      nasm
      nemo
      noto-fonts-cjk-serif
      obsidian
      odin
      openrgb
      openssl
      open-webui
      pavucontrol
      prismlauncher
      protontricks
      p7zip
      qbittorrent
      qemu
      searxng
      spotify
      thunderbird
      unrar
      unzip
      vesktop
      vim-full
      vimpc
      virt-manager
      wget
      winetricks
      wineWowPackages.stable
      zip
      zoxide
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      kate
      konsole
      plasma-workspace-wallpapers
    ];
  };
}
