{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ocamlPackages.ocaml-lsp
    ocamlPackages.ocamlformat
  ];

  extraConfigLuaPost = ''
    require'lspconfig'.ocamllsp.setup{}
  '';

  plugins.which-key.registrations = {
    "[e" = [ "<cmd>Lspsaga diagnostic_jump_next<cr>" "Next Diagnostic" ];
    "]e" = [ "<cmd>Lspsaga diagnostic_jump_prev<cr>" "Previous Diagnostic" ];
    "K" = [ "<cmd>Lspsaga hover_doc<cr>" "Code Hover" ];
    "F" = [ "<cmd>lua vim.lsp.buf.format({ async = true }) <cr>" "Format the current buffer" ];
    "gi" = [ "<cmd>Lspsaga incoming_calls<cr>" "Incoming Calls" ];
    "go" = [ "<cmd>Lspsaga outgoing_calls<cr>" "Outgoing Calls" ];
    "gD" = [ "<cmd>Lspsaga goto_definition<cr>" "Go to Definition" ];
    "gd" = [ "<cmd>Lspsaga peek_definition<cr>" "Peek Definition" ];
    "gr" = [ "<cmd>Lspsaga rename<cr>" "Code Rename" ];
    "gs" = [ ''<cmd>lua require("wtf").search() <cr>'' "Search diagnostic with Google" ];
    "<leader>f" = [ "<cmd>Lspsaga finder<cr>" "Code Finder" ];
    "<leader>a" = [ "<cmd>Lspsaga code_action<cr>" "Code Action" ];
    "<c-a>" = [ "<cmd>Lspsaga code_action<cr>" "Code Action" ];
  };

  filetype.extension = {
    "re" = "ocaml";
    "rei" = "ocaml";
  };

  plugins.nvim-cmp.mapping =
    {
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-d>" = "cmp.mapping.scroll_docs(-4)";
      "<C-e>" = "cmp.mapping.close()";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "<S-Tab>" = {
        action = "cmp.mapping.select_prev_item()";
        modes = [
          "i"
          "s"
        ];
      };
      "<Tab>" = {
        action = "cmp.mapping.select_next_item()";
        modes = [
          "i"
          "s"
        ];
      };
    };

  plugins.lsp = {
    enable = true;
    onAttach = builtins.readFile ./lsp.onAttach.lua;
    postConfig = builtins.readFile ./lsp.postConfig.lua;
    servers = {

      bashls.enable = true;
      bashls.autostart = true;

      dockerls.enable = true;
      dockerls.autostart = true;

      eslint.enable = true;
      eslint.autostart = true;

      gopls.enable = true;
      gopls.autostart = true;

      hls.enable = true;
      hls.autostart = true;

      htmx.enable = false;
      htmx.autostart = true;

      jsonls.enable = true;
      jsonls.autostart = true;

      lua-ls.enable = true;
      lua-ls.autostart = true;

      nil_ls.enable = true;
      nil_ls.autostart = true;

      rust-analyzer.enable = false;
      rust-analyzer.autostart = true;
      rust-analyzer.installCargo = false;
      rust-analyzer.installRustc = false;

      tsserver.enable = true;
      tsserver.autostart = true;

      rnix-lsp.enable = true;
      rnix-lsp.autostart = true;

      yamlls.enable = true;
      yamlls.autostart = true;
    };
  };
  plugins.lsp-format.enable = true;
  plugins.lspkind.enable = true;
  plugins.lspkind.cmp.enable = true;
  plugins.lspsaga = {
    enable = true;
    lightbulb.sign = false;
    lightbulb.virtualText = true;
    lightbulb.debounce = 40;
    ui.codeAction = "⛭";
  };

  plugins.codeium-nvim.enable = true;
  plugins.wtf.enable = true;
  plugins.nvim-autopairs.enable = true;
  plugins.nvim-cmp.enable = true;
  plugins.nvim-cmp.sources = [
    { name = "nvim_lsp"; }
    { name = "nvim_lsp_signature_help"; }
    { name = "nvim_lsp_document_symbol"; }
    { name = "codeium"; }
    { name = "luasnip"; } #For luasnip users.
    { name = "path"; }
    { name = "buffer"; }
    { name = "cmdline"; }
    { name = "spell"; }
    { name = "dictionary"; }
    { name = "fish"; }
    { name = "tmux"; }
    { name = "treesitter"; }
  ];
  plugins.cmp-nvim-lsp.enable = true;
  plugins.cmp-nvim-lsp-document-symbol.enable = true;
  plugins.cmp-nvim-lsp-signature-help.enable = true;
  plugins.cmp_luasnip.enable = true;
  plugins.cmp-path.enable = true;
  plugins.cmp-buffer.enable = true;
  plugins.cmp-cmdline.enable = true;
  plugins.cmp-spell.enable = true;
  plugins.cmp-dictionary.enable = true;
  plugins.cmp-fish.enable = true;
  plugins.cmp-tmux.enable = true;
  plugins.cmp-treesitter.enable = true;
}
