{
  programs.nixvim.plugins.telescope = {
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
      "<leader>sf" = "find_files";
      "<leader>sh" = "help_tags";
      "<leader>gf" = "git_files";
      "<leader>?" = "oldfiles";
      "<leader>sg" = "live_grep";
      "<leader>sr" = "resume";
      "<leader>ds" = "lsp_document_symbols";
      "<leader>/" = "current_buffer_fuzzy_find";
      # {
      #   action = "current_buffer_fuzzy_find, {}";
      #   options = {
      #     desc = "Buffer";
      #   };
      # };
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };

  programs.nixvim.extraConfigLua = ''
    require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    }
  '';
}
