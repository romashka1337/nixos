{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.rose-pine = {
      enable = true;
      settings.styles = {
        bold = true;
        transparency = false;
      };
    };
    extraConfigLua = ''
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
      })
    '';
  };
}
