{ pkgs, ... }:

{
  extraPlugins = [ pkgs.vimPlugins.neorg-telescope ];

  plugins.which-key.registrations."mp" = [ "<cmd>MarkdownPreview<cr>" "Preview Markdown" ];

  plugins.which-key.registrations."<leader>oj" = [ "<cmd>Neorg journal today<cr>" "Journal Today" ];
  plugins.which-key.registrations."<leader>oh" = [ "<cmd>Neorg workspace home<cr>" "Open Neorg Home" ];
  plugins.which-key.registrations."<leader>zm" = [ "<cmd>ZenMode<cr>" "Focus like a Japanese Philosopher 🧘" ];

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
    settings.theme = "dark";
    settings.port = "8686";
  };

  plugins.zen-mode = {
    enable = true;
  };
}
