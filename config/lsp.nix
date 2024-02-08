{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    ChatGPT-nvim
  ];

  extraPackages = [
    pkgs.ocamlPackages.ocaml-lsp
    # For better format in OCaml Lang need to install 
    # 👇
    # pkgs.ocamlPackages.ocamlformat

    # For Haskell
    # 👇
    # ghc
  ];

  extraConfigLuaPost = ''
    require'lspconfig'.ocamllsp.setup{}
  '';

  filetype.extension."re" = "ocaml";
  filetype.extension."rei" = "ocaml";

  plugins.which-key.registrations."<leader><space>" = [ "<cmd>Lspsaga term_toggle<cr>" "Open Terminal" ];
  plugins.which-key.registrations."ge" = [ "<cmd>Trouble<cr>" "Next Diagnostic" ];
  plugins.which-key.registrations."[e" = [ "<cmd>Lspsaga diagnostic_jump_next<cr>" "Next Diagnostic" ];
  plugins.which-key.registrations."]e" = [ "<cmd>Lspsaga diagnostic_jump_prev<cr>" "Previous Diagnostic" ];
  plugins.which-key.registrations."K" = [ "<cmd>Lspsaga hover_doc<cr>" "Code Hover" ];
  plugins.which-key.registrations."F" = [ "<cmd>lua vim.lsp.buf.format({ async = true }) <cr>" "Format the current buffer" ];
  plugins.which-key.registrations."gl" = [ "<cmd>LspInfo<cr>" "Show LSP Info" ];
  plugins.which-key.registrations."gt" = [ "<cmd>Lspsaga outline<cr>" "Code Action" ];
  plugins.which-key.registrations."ga" = [ "<cmd>Lspsaga code_action<cr>" "Code Action" ];
  plugins.which-key.registrations."gi" = [ "<cmd>Lspsaga incoming_calls<cr>" "Incoming Calls" ];
  plugins.which-key.registrations."go" = [ "<cmd>Lspsaga outgoing_calls<cr>" "Outgoing Calls" ];
  plugins.which-key.registrations."gD" = [ "<cmd>Lspsaga goto_definition<cr>" "Go to Definition" ];
  plugins.which-key.registrations."gd" = [ "<cmd>Lspsaga peek_definition<cr>" "Peek Definition" ];
  plugins.which-key.registrations."gr" = [ "<cmd>Lspsaga rename<cr>" "Code Rename" ];
  plugins.which-key.registrations."gs" = [ ''<cmd>lua require("wtf").search() <cr>'' "Search diagnostic with Google" ];
  plugins.which-key.registrations."<leader>f" = [ "<cmd>Lspsaga finder<cr>" "Code Finder" ];

  plugins.nvim-cmp.mapping."<C-Space>" = "cmp.mapping.complete()";
  plugins.nvim-cmp.mapping."<C-d>" = "cmp.mapping.scroll_docs(-4)";
  plugins.nvim-cmp.mapping."<C-e>" = "cmp.mapping.close()";
  plugins.nvim-cmp.mapping."<C-f>" = "cmp.mapping.scroll_docs(4)";
  plugins.nvim-cmp.mapping."<CR>" = "cmp.mapping.confirm({ select = true })";

  plugins.nvim-cmp.mapping."<S-Tab>".action = "cmp.mapping.select_prev_item()";
  plugins.nvim-cmp.mapping."<S-Tab>".modes = [
    "i"
    "s"
  ];

  plugins.nvim-cmp.mapping."<Tab>".action = "cmp.mapping.select_next_item()";
  plugins.nvim-cmp.mapping."<Tab>".modes = [
    "i"
    "s"
  ];

  plugins.lsp.enable = true;
  plugins.lsp.onAttach = builtins.readFile ./lsp.onAttach.lua;
  plugins.lsp.postConfig = builtins.readFile ./lsp.postConfig.lua;

  plugins.lsp.servers.bashls.enable = true;
  plugins.lsp.servers.bashls.autostart = true;

  plugins.lsp.servers.dockerls.enable = true;
  plugins.lsp.servers.dockerls.autostart = true;

  plugins.lsp.servers.eslint.enable = true;
  plugins.lsp.servers.eslint.autostart = true;

  plugins.lsp.servers.gopls.enable = true;
  plugins.lsp.servers.gopls.autostart = true;

  plugins.lsp.servers.hls.enable = true;
  plugins.lsp.servers.hls.autostart = true;

  plugins.lsp.servers.htmx.enable = !pkgs.stdenv.isDarwin;
  plugins.lsp.servers.htmx.autostart = true;

  plugins.lsp.servers.jsonls.enable = true;
  plugins.lsp.servers.jsonls.autostart = true;

  plugins.lsp.servers.lua-ls.enable = true;
  plugins.lsp.servers.lua-ls.autostart = true;

  plugins.lsp.servers.nil_ls.enable = true;
  plugins.lsp.servers.nil_ls.autostart = true;

  plugins.lsp.servers.rust-analyzer.enable = false;
  plugins.lsp.servers.rust-analyzer.autostart = true;
  plugins.lsp.servers.rust-analyzer.installCargo = false;
  plugins.lsp.servers.rust-analyzer.installRustc = false;

  plugins.lsp.servers.tsserver.enable = true;
  plugins.lsp.servers.tsserver.autostart = true;

  plugins.lsp.servers.rnix-lsp.enable = true;
  plugins.lsp.servers.rnix-lsp.autostart = true;

  plugins.lsp.servers.yamlls.enable = true;
  plugins.lsp.servers.yamlls.autostart = true;

  plugins.lsp-format.enable = true;
  plugins.lspkind.enable = true;
  plugins.lspkind.cmp.enable = true;

  plugins.lspsaga.enable = true;
  plugins.lspsaga.lightbulb.sign = false;
  plugins.lspsaga.lightbulb.virtualText = true;
  plugins.lspsaga.lightbulb.debounce = 40;
  plugins.lspsaga.ui.codeAction = "⛭";
  plugins.trouble.enable = true;

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
