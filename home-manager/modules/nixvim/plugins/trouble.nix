{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
    };

    extraConfigLua = ''
      vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")

      vim.keymap.set("n", "<C-j>", 
        function()
          if require('trouble').is_open() then
            require('trouble').next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      )

      vim.keymap.set("n", "<C-k>", 
        function()
          if require('trouble').is_open() then
            require('trouble').prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      )
    '';
  };
}
