{ pkgs, ... }:

{
  plugins.treesitter = {
    enable = true;
      
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };

    nixvimInjections = true;

    grammarPackages = with pkgs.tree-sitter-grammars; [
      tree-sitter-bash
      tree-sitter-c
      tree-sitter-nix
      tree-sitter-zig
    ];
  };
}
