{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.collaps1ng = {
      isNormalUser = true;
      description = "collaps1ng";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

  services.getty.autologinUser = "collaps1ng";
}
