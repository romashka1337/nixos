{
  programs.nixvim.plugins = {
    lsp-format = {
      enable = true;
    };

    lsp = {
      enable = true;

      servers = {
        erlangls.enable = true;
        elixirls.enable = true;
        ts_ls.enable = true;
        nil_ls.enable = true;
        gopls = {
          enable = true;
        };
        bashls.enable = true;
        nixd.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<C-h>" = {
            action = "signature_help";
            desc = "Signature help";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
        };
        diagnostic = {
          "<leader>e" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };

    none-ls = {
      enable = true;
      enableLspFormat = true;
      settings.update_in_insert = false;
      sources = {
        code_actions = {
          gitsigns.enable = true;
          statix.enable = true;
          impl.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          yamllint.enable = true;
          golangci_lint.enable = true;
        };
        formatting = {
          erlfmt.enable = true;
          golines.enable = true;
          goimports.enable = true;
          alejandra.enable = true;
          black = {
            enable = true;
            settings = ''
              {
                extra_args = { "--fast" },
              }
            '';
          };
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
            settings = ''
              {
                extra_args = { "--single-quote --print-width 80 --tab-width 2 --no-semi false" },
              }
            '';
          };
          stylua.enable = true;
          yamlfmt.enable = true;
        };
      };
    };
  };
}
