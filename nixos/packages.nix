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
    # all of this should be in home-manager???
    telegram-desktop
    google-chrome
    postman
    vscode
    deluge
    vlc
    dbeaver-bin
    lens
    anydesk
    firefox
    remmina

    vial

    # cli
    git
    libgcc
    htop
    fzf
    ripgrep
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
    traceroute
    psmisc
    sing-box
    tcpdump
    minio-client
    linkerd
    graphviz
    gcc
    claude-code
    libgbm

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
    # pprof

    # wm
    hyprshot
    wl-clipboard
    cliphist
    hyprland
    xdg-desktop-portal-hyprland
    waybar

    pipewire
    pulseaudio
    pamixer
    brightnessctl

    home-manager
  ];

  services.udev.packages = with pkgs; [
    vial
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono

    font-awesome
    pkgs.nerd-fonts.symbols-only
  ];
}
