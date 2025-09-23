{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Rose Pine";
      font-family = "JetBrains Mono";
      font-style = "Bold";
      font-size = 13.0;
      background-opacity = 1;

      confirm-close-surface = false;
      shell-integration-features = "no-cursor,no-sudo,no-title";
      gtk-titlebar = false;
      keybind = "ctrl+enter=unbind";

      cursor-style = "block";
      cursor-style-blink = false;
      mouse-scroll-multiplier = 0.3;
    };
  };
}
