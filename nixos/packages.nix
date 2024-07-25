{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # gui
    telegram-desktop
    alacritty
    google-chrome
    rofi
    wofi
    postman
    vscode

    vial
    via

    # cli
    tmux
    git
    libgcc
    htop
    fzf
    ripgrep
    swww
    gnumake
    kubectl
    kubernetes-helm
    zip
    unzip
    jq
    dig

    nodejs
    lua
    protobuf

    # golang specific
    go
    golines
    air
    protoc-gen-go
    protoc-gen-go-grpc

    # wm
    xwayland
    wl-clipboard
    cliphist
    # herbstluftwm
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    polybar
    waybar
    grim
    slurp

    pipewire
    pulseaudio
    pamixer
    brightnessctl

    home-manager
  ];

  services.udev.packages = with pkgs; [
    vial
    via
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono

    font-awesome
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
