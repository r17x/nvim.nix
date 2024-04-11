{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.flake-parts.follows = "flake-parts";
    flake-parts.url = "github:hercules-ci/flake-parts";

    vimPlugins_nvim-sops.url = "github:lucidph3nx/nvim-sops";
    vimPlugins_nvim-sops.flake = false;
  };

  outputs =
    { nixvim
    , nixpkgs
    , flake-parts
    , ...
    } @ inputs:
    let
      config = import ./config; # import the module directly

      # all vimPlugins from inputs with prefix "vimPlugins_"
      # example:
      # inputs.vimPlugins_myvim-plugins-from-github.url = "github:owner/repo";
      # inputs.vimPlugins_myvim-plugins-from-github.flake = false;
      mkFlake2VimPlugins = import ./nix/lib/mkFlake2VimPlugin.nix inputs;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs
        , system
        , ...
        }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nvim = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = config;
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              (_final: prev: {
                vimPlugins = prev.vimPlugins.extend (_final: _prev:
                  mkFlake2VimPlugins {
                    buildVimPlugin = prev.vimUtils.buildVimPlugin;
                    lib = prev.lib;
                  }
                );
              })
            ];
          };
        in
        {
          _module.args.pkgs = pkgs;

          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "A nixvim configuration";
            };
          };

          devShells.default = pkgs.mkShell { packages = [ nvim ]; };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
        };
    };
}
