{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["nodejs_15"];
  };

  environment.systemPackages = with pkgs; [
    # gui
    telegram-desktop
    alacritty
    google-chrome
    rofi
    wofi
    postman

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
    zip
    unzip
    jq

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
    herbstluftwm
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    polybar
    waybar
    grim
    slurp

    home-manager
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    
    font-awesome
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
