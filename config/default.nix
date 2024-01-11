{
  # Import all your configuration modules here
  imports = [
    {
      config = {
        globals.mapleader = " ";

        options = {
          number = true;
          relativenumber = true;
        };
      };
    }

    ./ui.nix
    ./keymap.nix
    ./editor.nix
    ./lsp.nix
  ];
}
