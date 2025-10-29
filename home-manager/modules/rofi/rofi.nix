{
  programs.rofi = {
    enable = true;
  };
  home.file = {
    "/.config/rofi/config.rasi" = {
      text = builtins.readFile ./rofi.rasi;
    };
  };
}
