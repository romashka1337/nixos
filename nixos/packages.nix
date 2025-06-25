let
  _ = import <nixpkgs-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  environment.systemPackages = with pkgs; [
    # gui
    telegram-desktop
    google-chrome
    rofi
    postman
    vscode
    deluge
    vlc
    hyprpolkitagent
    dbeaver-bin
    lens
    ghostty

    remmina
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
    iptables
    docker
    docker-compose
    runc
    containerd
    npm-check-updates
    traceroute
    psmisc
    sing-box
    tcpdump
    gettext
    minio-client
    linkerd

    nodejs
    lua
    protobuf

    # golang specific
    go
    golines
    air
    protoc-gen-go
    protoc-gen-go-grpc
    golangci-lint
    impl
    pprof

    # wm
    xwayland
    wl-clipboard
    cliphist
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
    pkgs.nerd-fonts.symbols-only
  ];
}
