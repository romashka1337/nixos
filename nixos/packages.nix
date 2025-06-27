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
    via
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono

    font-awesome
    pkgs.nerd-fonts.symbols-only
  ];
}
