# this declarations based on {https://github.com/r17x/nixpkgs/blob/main/configs/nvim/lua/config/keymap.lua}
{
  plugins.which-key = {
    enable = true;
    operators = { gc = "Comments"; };
    triggers = [ "<leader>" "g" ];
    registrations = {
      "<leader>w" = [ "<cmd>w<cr>" "Write current buffer" ];
      "<leader>ww" = [ "<cmd>w!<cr>" "Write current buffer forced" ];
      "<leader>wq" = [ "<cmd>wq<cr>" "Write current buffer and quit" ];
      "<leader>wqq" = [ "<cmd>wq<cr>" "Write & quit forced" ];
      "<c-h>" = [ "<c-w>h" "Move top" ];
      "<c-j>" = [ "<c-w>j" "Move down" ];
      "<c-k>" = [ "<c-w>k" "Move left" ];
      "<c-l>" = [ "<c-w>l" "Move right" ];

      "<up>" = [ "<cmd>resize +1<CR>" "resize window up" ];
      "<down>" = [ "<cmd>resize -1<CR>" "resize window down" ];
      "<left>" = [ "<cmd>vertical resize -1<CR>" "resize window right" ];
      "<right>" = [ "<cmd>vertical resize +1<CR>" "resize window left" ];
    };
  };
}
