# this declarations based on {https://github.com/r17x/nixpkgs/blob/main/configs/nvim/lua/config/keymap.lua}
{
  plugins.which-key = {
    enable = true;
    operators = { gc = "Comments"; };

    registrations = {
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
