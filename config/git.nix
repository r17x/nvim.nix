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
    numhl = true;
    linehl = false;
    currentLineBlameOpts.virtText = true;
    currentLineBlameOpts.virtTextPos = "eol";
    currentLineBlameOpts.ignoreWhitespace = false;
    signs.add.hl = "GitSignsAdd";
    signs.add.numhl = "GitSignsAddNr";
    signs.add.linehl = "GitSignsAddLn";
    signs.add.text = "┃";
    signs.change.hl = "GitSignsChange";
    signs.change.numhl = "GitSignsChangeNr";
    signs.change.linehl = "GitSignsChangeLn";
    signs.change.text = "┃";
    signs.delete.hl = "GitSignsDelete";
    signs.delete.text = "";
    signs.delete.numhl = "GitSignsDeleteNr";
    signs.delete.linehl = "GitSignsDeleteLn";
    signs.topdelete.hl = "GitSignsDelete";
    signs.topdelete.numhl = "GitSignsDeleteNr";
    signs.topdelete.linehl = "GitSignsDeleteLn";
    signs.topdelete.text = "‾";
    signs.changedelete.hl = "DiffDelete";
    signs.changedelete.numhl = "GitSignsChangeNr";
    signs.changedelete.linehl = "GitSignsChangeLn";
    signs.changedelete.text = "~";
  };
}
