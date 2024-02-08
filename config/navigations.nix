# this declarations based on {https://github.com/r17x/nixpkgs/blob/main/configs/nvim/lua/config/keymap.lua}
{ helpers, ... }:

let
  inherit (helpers) mkRaw;

  tb.findFiles = mkRaw "require'telescope.builtin'.find_files";
  tb.liveGrep = mkRaw "require'telescope.builtin'.live_grep";
  tb.findBuffers = mkRaw "require'telescope.builtin'.buffers";
  tb.findHelpTags = mkRaw "require'telescope.builtin'.help_tags";

  resize.up = mkRaw "function() vim.cmd[[ resize +1 ]] end";
  resize.down = mkRaw "function() vim.cmd [[ resize -1 ]] end";
  resize.left = mkRaw "function() vim.cmd [[ vertical resize -1 ]] end";
  resize.right = mkRaw "function() vim.cmd [[ vertical resize +1 ]] end";
in

{
  clipboard.register = "unnamed";
  plugins.telescope.enable = true;

  plugins.which-key.enable = true;
  plugins.which-key.operators = { gc = "Comments"; };
  plugins.which-key.triggers = [ "<leader>" "g" ];

  plugins.which-key.registrations."<leader>w" = [ "<cmd>w<cr>" "Write current buffer" ];
  plugins.which-key.registrations."<leader>ww" = [ "<cmd>w!<cr>" "Write current buffer forced" ];
  plugins.which-key.registrations."<leader>wq" = [ "<cmd>wq<cr>" "Write current buffer and quit" ];
  plugins.which-key.registrations."<leader>wqq" = [ "<cmd>wq<cr>" "Write & quit forced" ];

  plugins.which-key.registrations."Y" = [ "\"+yy" "Copy to Clipboard!" ];
  plugins.which-key.registrations."p" = [ "\"+p" "Paste from Clipboard" ];

  plugins.which-key.registrations."<c-h>" = [ "<c-w>h" "Move top" ];
  plugins.which-key.registrations."<c-j>" = [ "<c-w>j" "Move down" ];
  plugins.which-key.registrations."<c-k>" = [ "<c-w>k" "Move left" ];
  plugins.which-key.registrations."<c-l>" = [ "<c-w>l" "Move right" ];

  plugins.which-key.registrations."ff" = [ tb.findFiles "Find by files" ];
  plugins.which-key.registrations."fb" = [ tb.findBuffers "Find by current buffers" ];
  plugins.which-key.registrations."fh" = [ tb.findHelpTags "Find by help tags" ];
  plugins.which-key.registrations."fg" = [ tb.liveGrep "Find by words" ];

  plugins.which-key.registrations."<up>" = [ resize.up "resize window up" ];
  plugins.which-key.registrations."<down>" = [ resize.down "resize window down" ];
  plugins.which-key.registrations."<left>" = [ resize.left "resize window right" ];
  plugins.which-key.registrations."<right>" = [ resize.right "resize window left" ];
}
