{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;

      font = {
        size = 12.0;
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
        };
      };

      # keyboard = {
      #   bindings = [
      #     {
      #       key = "B";
      #       mods = "Control";
      #       mode = "AppCursor";
      #       action = "ToggleViMode";
      #     }
      #   ];
      # };
    };
  };
}
