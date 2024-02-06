{ pkgs, ... }:
{
  # TODO: git signs toggle
  extraPlugins = with pkgs.vimPlugins; [ vimagit ];
  plugins.which-key.registrations."mg" = [ "<cmd>Magit<CR>" "Open Magit" ];
}
