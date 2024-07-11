{
  imports = [
    ./opts.nix
    ./keymaps.nix
    ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        disable_underline = true;
        term_colors = true;
        color_overrides.mocha.base = "#1e1e2f";
        styles = {
          booleans = [
            "bold"
            "italic"
          ];
          conditionals = ["bold"];
        };
        integrations = {
          cmp = true;
          gitsigns = true;
          treesitter = true;
        };
      };
    };
  };
}
