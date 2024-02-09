{ pkgs, ... }:

{
  extraPlugins = [ pkgs.vimPlugins.nvim-sops ];

  extraConfigLuaPost = "require('nvim_sops').setup()";
}
