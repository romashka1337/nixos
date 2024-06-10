{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        file-browser = {
          enable = true;
        };
        fzf-native = {
          enable = true;
        };
      };

      keymaps = {
        "<leader>sh" = "help_tags";
        "<leader>gf" = "git_files";
        "<leader>?" = "oldfiles";
        "<leader>sg" = "live_grep";
        "<leader>sr" = "resume";
        "<leader>ds" = "lsp_document_symbols";
      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "node_modules/"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };

    extraConfigLua = ''
      require("telescope").setup{
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      }
      vim.keymap.set('n', '<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>sf',
        function ()
          require('telescope.builtin').find_files({hidden = true})
        end,
        { desc = '[S]earch [F]iles' }
      )
    '';
  };
}
