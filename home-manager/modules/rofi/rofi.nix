{
  home.file = {
    "/.config/rofi/config.rasi" = {
      text = builtins.readFile ./rofi.rasi;
    };
  };
}
