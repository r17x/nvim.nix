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

  plugins.which-key.registrations = {
    "mg" = [ "<cmd>Magit<CR>" "Open Magit" ];
    "<leader>gss" = [ gs.toggle_signs "Toggle Sign Column" ];
    "<leader>gsn" = [ gs.toggle_numhl "Toggle Num Hightlight" ];
    "<leader>gsl" = [ gs.toggle_linehl "Toggle Line Hightlight" ];
    "<leader>gsw" = [ gs.toggle_word_diff "Toggle Word Diff" ];
    "<leader>gsd" = [ gs.toggle_deleted "Toggle Deleted" ];
    "<leader>gsb" = [ gs.toggle_current_line_blame "Toggle Current line blame" ];
  };

  plugins.gitsigns = {
    enable = true;
    settings.numhl = true;
    settings.linehl = false;
    settings.current_line_blame_opts.virt_text = true;
    settings.current_line_blame_opts.virt_text_pos = "eol";
    settings.current_line_blame_opts.ignore_whitespace = false;
    settings.signs.add.hl = "GitSignsAdd";
    settings.signs.add.numhl = "GitSignsAddNr";
    settings.signs.add.linehl = "GitSignsAddLn";
    settings.signs.add.text = "┃";
    settings.signs.change.hl = "GitSignsChange";
    settings.signs.change.numhl = "GitSignsChangeNr";
    settings.signs.change.linehl = "GitSignsChangeLn";
    settings.signs.change.text = "┃";
    settings.signs.delete.hl = "GitSignsDelete";
    settings.signs.delete.text = "";
    settings.signs.delete.numhl = "GitSignsDeleteNr";
    settings.signs.delete.linehl = "GitSignsDeleteLn";
    settings.signs.topdelete.hl = "GitSignsDelete";
    settings.signs.topdelete.numhl = "GitSignsDeleteNr";
    settings.signs.topdelete.linehl = "GitSignsDeleteLn";
    settings.signs.topdelete.text = "‾";
    settings.signs.changedelete.hl = "DiffDelete";
    settings.signs.changedelete.numhl = "GitSignsChangeNr";
    settings.signs.changedelete.linehl = "GitSignsChangeLn";
    settings.signs.changedelete.text = "~";
  };
}
