{
  programs.nixvim.plugins.luasnip = {
    enable = true;
  };
  programs.nixvim.plugins.cmp = {
    enable = true;

    settings = {
      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

      mapping = {
        "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<C-y>" = "cmp.mapping.confirm({ select = true })";
      };

      sources = [
        {name = "path";}
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {name = "nvim_lsp_signature_help";}
        {
          name = "buffer";
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
      ];
    };
  };
}
