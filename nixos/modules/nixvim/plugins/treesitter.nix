{
  programs.nixvim.plugins = {
    hmts.enable = true;

    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      indent = true;
    };

    treesitter-context = {
      enable = true;
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };
      move = {
        enable = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "<leader>a" = "@parameters.inner";
        };
        swapPrevious = {
          "<leader>A" = "@parameter.outer";
        };
      };
    };

    treesitter-refactor = {
      enable = true;
      # highlightDefinitions = {
      #   enable = true;
      #   # Set to false if you have an `updatetime` of ~100.
      #   clearOnCursorMove = false;
      # };
    };
  };
}
