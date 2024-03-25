{ pkgs, ... }:

{
  extraPlugins = [ pkgs.vimPlugins.neorg-telescope ];

  plugins.which-key.registrations."mp" = [ "<cmd>MarkdownPreview<cr>" "Preview Markdown" ];

  plugins.which-key.registrations."<leader>oj" = [ "<cmd>Neorg journal today<cr>" "Journal Today" ];
  plugins.which-key.registrations."<leader>oh" = [ "<cmd>Neorg workspace home<cr>" "Open Neorg Home" ];

  plugins.neorg.enable = true;
  plugins.neorg.lazyLoading = true;
  plugins.neorg.modules = {
    "core.defaults" = { __empty = null; };
    "core.integrations.treesitter" = { };
    "core.integrations.telescope" = { };
    "core.concealer" = { config = { }; };
    "core.completion" = {
      config = {
        engine = "nvim-cmp";
      };
    };
    "core.dirman" = {
      config = {
        workspaces = {
          home = "~/.config/nixpkgs/notes";
        };
      };
    };
    "core.esupports.metagen" = {
      config = {
        type = "auto";
      };
    };
  };

  plugins.markdown-preview = {
    enable = true;
    theme = "dark";
    port = 8686;
  };
}
