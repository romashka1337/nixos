{
  programs.nixvim.plugins = {
    fugitive = {
      enable = true;
    };
    gitsigns = {
      enable = true;
      settings = {
        trouble = true;
        # current_line_blame = true;
        signs = {
          add = {
            text = "+";
          };
          change = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
          untracked = {
            text = "?";
          };
        };
      };
    };
  };
}
