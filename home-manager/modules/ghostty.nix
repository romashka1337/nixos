{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "rose-pine";
      font-family = "JetBrains Mono";
      font-style = "Bold";
      font-size = 12.0;
      background-opacity = 1;

      confirm-close-surface = false;
      shell-integration = "zsh";
      copy-on-select = false;
      shell-integration-features = "no-cursor,no-sudo,no-title";
      gtk-titlebar = false;
      keybind = "ctrl+enter=unbind";

      cursor-style = "block";
      cursor-style-blink = false;
      cursor-click-to-move = true;
      mouse-scroll-multiplier = 0.3;
      mouse-shift-capture = true;
    };
  };
}
