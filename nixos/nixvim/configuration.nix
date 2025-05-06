{ ... }:

{
  programs.nixvim = { 
    imports = [ ./plugins/plugins.nix ];

    config = {
      enable = true;

      opts = {
        number = true;
        relativenumber = true;
        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;
        expandtab = true;
      };
    };
  };
}
