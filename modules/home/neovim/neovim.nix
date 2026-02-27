{ pkgs, config, lib, ... }:
{
  stylix.targets.neovim.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim

      oil-nvim
      nvim-web-devicons

      gitsigns-nvim
      lualine-nvim

      which-key-nvim
      nvim-autopairs
      vim-sleuth
    ];

    extraPackages = with pkgs; [
      pyright
      nil
      lua-language-server

      black
      nixfmt
      stylua

      ripgrep
      fd
    ];

    initLua = builtins.readFile ./nvim/init.lua;
  };

  xdg.configFile = {
    #"nvim/init.lua".source = ./nvim/init.lua;
    "nvim/lua/opts.lua".source = ./nvim/opts.lua;
    "nvim/lua/keybinds.lua".source = ./nvim/keybinds.lua;
    "nvim/lua/plugins/telescope.lua".source = ./nvim/plugins/telescope.lua;
    "nvim/lua/plugins/lualine.lua".source = ./nvim/plugins/lualine.lua;
    "nvim/lua/plugins/oil.lua".source = ./nvim/plugins/oil.lua;
    "nvim/lua/plugins/treesitter.lua".source = ./nvim/plugins/treesitter.lua;
    "nvim/lua/plugins/lsp.lua".source = ./nvim/plugins/lsp.lua;
    "nvim/lua/plugins/cmp.lua".source = ./nvim/plugins/cmp.lua;
    "nvim/lua/plugins/gitsigns.lua".source = ./nvim/plugins/gitsigns.lua;
    "nvim/lua/plugins/which-key.lua".source = ./nvim/plugins/which-key.lua;
    "nvim/lua/plugins/misc.lua".source = ./nvim/plugins/misc.lua;
  };
}
