{ pkgs, ... }:
{
  imports = [
    ./modules/main.nix
  ];

  home = {
    username = "collaps1ng";
    homeDirectory = "/home/collaps1ng";
    stateVersion = "24.05";
  };
}
