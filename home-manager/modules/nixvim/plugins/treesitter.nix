{ pkgs, ... }:
{
  programs.nixvim = {
    extraFiles = {
      "queries/ecma/highlights.scm".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/nvim-treesitter/nvim-treesitter/master/queries/ecma/highlights.scm";
        sha256 = "sha256-N4NFR+uqnBYMrYfqvTg4fUcisbQNRLq1TY5x0f7/m54=";
      };
    };

    plugins = {
      hmts.enable = true;
      treesitter = {
        enable = true;
        nixvimInjections = true;
        folding.enable = true;
        indent.enable = true;
        settings.highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
      };
      treesitter-context.enable = true;

      # treesitter-textobjects = {
      #   enable = true;
      #   settings = {
      #     select = {
      #       enable = true;
      #       lookahead = true;
      #       keymaps = {
      #         "aa" = "@parameter.outer";
      #         "ia" = "@parameter.inner";
      #         "af" = "@function.outer";
      #         "if" = "@function.inner";
      #         "ac" = "@class.outer";
      #         "ic" = "@class.inner";
      #         "ii" = "@conditional.inner";
      #         "ai" = "@conditional.outer";
      #         "il" = "@loop.inner";
      #         "al" = "@loop.outer";
      #         "at" = "@comment.outer";
      #       };
      #     };
      #     move = {
      #       enable = true;
      #       gotoNextStart = {
      #         "]m" = "@function.outer";
      #         "]]" = "@class.outer";
      #       };
      #       gotoNextEnd = {
      #         "]M" = "@function.outer";
      #         "][" = "@class.outer";
      #       };
      #       gotoPreviousStart = {
      #         "[m" = "@function.outer";
      #         "[[" = "@class.outer";
      #       };
      #       gotoPreviousEnd = {
      #         "[M" = "@function.outer";
      #         "[]" = "@class.outer";
      #       };
      #     };
      #     swap = {
      #       enable = true;
      #       swapNext = {
      #         "<leader>a" = "@parameters.inner";
      #       };
      #       swapPrevious = {
      #         "<leader>A" = "@parameter.outer";
      #       };
      #     };
      #   };
      # };

      # treesitter-refactor = {
      #   enable = true;
      #   # highlightDefinitions = {
      #   #   enable = true;
      #   #   # Set to false if you have an `updatetime` of ~100.
      #   #   clearOnCursorMove = false;
      #   # };
      # };

    };
  };
}
