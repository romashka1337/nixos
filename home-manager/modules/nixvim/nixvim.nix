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
        italic = false;
        transparency = false;
      };
    };
    # autoCmd = [
    #   {
    #     event = "LspAttach";
    #     callback.__raw = ''
    #       function(args)
    #         local client = vim.lsp.get_client_by_id(args.data.client_id)
    #         if client then
    #           client.server_capabilities.semanticTokensProvider = nil
    #         end
    #       end
    #     '';
    #   }
    # ];
    # extraConfigLua = ''
    #   require("nvim-treesitter.configs").setup({
    #     highlight = {
    #       enable = true,
    #       additional_vim_regex_highlighting = false
    #     },
    #   })
    # '';
  };
}
