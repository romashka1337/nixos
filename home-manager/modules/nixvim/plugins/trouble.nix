{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
    };

    extraConfigLua = ''
      vim.keymap.set("n", "<leader>tt", "<cmd>Trouble<CR>1<CR><CR>")

      vim.keymap.set("n", "[t", function()
        require("trouble").next({ skip_groups = true, jump = true });
      end)

      vim.keymap.set("n", "]t", function()
        require("trouble").previous({ skip_groups = true, jump = true });
      end)
    '';
  };
}
