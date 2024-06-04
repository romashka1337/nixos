{ config, lib, ... }: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<C-u>" = "<C-u>zz";
          "<C-d>" = "<C-d>zz";
          "<C-j>" = "<cmd>cnext<CR>zz";
          "<C-k>" = "<cmd>cprev<CR>zz";
          "gd" = "definition";
          "K" = "hover";
          "<leader>tt" = ":TroubleToggle<CR>";
          "<leader>f" = "<cmd>lua vim.lsp.buf.format()<cr>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
    in
      config.nixvim.helpers.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual);
  };
}
