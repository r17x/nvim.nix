{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [ ChatGPT-nvim ];

  extraConfigLuaPost = "require('chatgpt').setup()";

  plugins.which-key.registrations."<leader>cc" = [ [ "<cmd>ChatGPT<cr>" "Open ChatGPT Prompt" { mode = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>ce" = [ [ "<cmd>ChatGPTEditWithInstruction<CR>" "Edit with instruction" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cg" = [ [ "<cmd>ChatGPTRun grammar_correction<CR>" "Grammar Correction" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>ct" = [ [ "<cmd>ChatGPTRun translate<CR>" "Translate" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>ck" = [ [ "<cmd>ChatGPTRun keywords<CR>" "Keywords" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cd" = [ [ "<cmd>ChatGPTRun docstring<CR>" "Docstring" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>ca" = [ [ "<cmd>ChatGPTRun add_tests<CR>" "Add Tests" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>co" = [ [ "<cmd>ChatGPTRun optimize_code<CR>" "Optimize Code" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cs" = [ [ "<cmd>ChatGPTRun summarize<CR>" "Summarize" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cf" = [ [ "<cmd>ChatGPTRun fix_bugs<CR>" "Fix Bugs" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cx" = [ [ "<cmd>ChatGPTRun explain_code<CR>" "Explain Code" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cr" = [ [ "<cmd>ChatGPTRun roxygen_edit<CR>" "Roxygen Edit" { modes = [ "n" "v" ]; } ] ];

  plugins.which-key.registrations."<leader>cl" = [ [ "<cmd>ChatGPTRun code_readability_analysis<CR>" "Code Readability Analysis" { modes = [ "n" "v" ]; } ] ];
}
