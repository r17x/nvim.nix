{ pkgs, helpers, ... }:

let
  inherit (helpers) mkRaw;

  gs.toggle_signs = mkRaw "require'gitsigns'.toggle_signs";
  gs.toggle_numhl = mkRaw "require'gitsigns'.toggle_numhl";
  gs.toggle_linehl = mkRaw "require'gitsigns'.toggle_linehl";
  gs.toggle_word_diff = mkRaw "require'gitsigns'.toggle_word_diff";
  gs.toggle_deleted = mkRaw "require'gitsigns'.toggle_deleted";
  gs.toggle_current_line_blame = mkRaw "require'gitsigns'.toggle_current_line_blame";

in

{
  extraPlugins = with pkgs.vimPlugins; [ vimagit ];

  plugins.which-key.registrations."mg" = [ "<cmd>Magit<CR>" "Open Magit" ];

  plugins.which-key.registrations."<leader>gss" = [ gs.toggle_signs "Toggle Sign Column" ];
  plugins.which-key.registrations."<leader>gsn" = [ gs.toggle_numhl "Toggle Num Hightlight" ];
  plugins.which-key.registrations."<leader>gsl" = [ gs.toggle_linehl "Toggle Line Hightlight" ];
  plugins.which-key.registrations."<leader>gsw" = [ gs.toggle_word_diff "Toggle Word Diff" ];
  plugins.which-key.registrations."<leader>gsd" = [ gs.toggle_deleted "Toggle Deleted" ];
  plugins.which-key.registrations."<leader>gsb" = [ gs.toggle_current_line_blame "Toggle Current line blame" ];

  plugins.gitsigns.enable = true;
  plugins.gitsigns.numhl = true;
  plugins.gitsigns.linehl = false;
  plugins.gitsigns.currentLineBlameOpts.virtText = true;
  plugins.gitsigns.currentLineBlameOpts.virtTextPos = "eol";
  plugins.gitsigns.currentLineBlameOpts.ignoreWhitespace = false;
  plugins.gitsigns.signs.add.hl = "GitSignsAdd";
  plugins.gitsigns.signs.add.numhl = "GitSignsAddNr";
  plugins.gitsigns.signs.add.linehl = "GitSignsAddLn";
  plugins.gitsigns.signs.add.text = "┃";
  plugins.gitsigns.signs.change.hl = "GitSignsChange";
  plugins.gitsigns.signs.change.numhl = "GitSignsChangeNr";
  plugins.gitsigns.signs.change.linehl = "GitSignsChangeLn";
  plugins.gitsigns.signs.change.text = "┃";
  plugins.gitsigns.signs.delete.hl = "GitSignsDelete";
  plugins.gitsigns.signs.delete.text = "";
  plugins.gitsigns.signs.delete.numhl = "GitSignsDeleteNr";
  plugins.gitsigns.signs.delete.linehl = "GitSignsDeleteLn";
  plugins.gitsigns.signs.topdelete.hl = "GitSignsDelete";
  plugins.gitsigns.signs.topdelete.numhl = "GitSignsDeleteNr";
  plugins.gitsigns.signs.topdelete.linehl = "GitSignsDeleteLn";
  plugins.gitsigns.signs.topdelete.text = "‾";
  plugins.gitsigns.signs.changedelete.hl = "DiffDelete";
  plugins.gitsigns.signs.changedelete.numhl = "GitSignsChangeNr";
  plugins.gitsigns.signs.changedelete.linehl = "GitSignsChangeLn";
  plugins.gitsigns.signs.changedelete.text = "~";
}
