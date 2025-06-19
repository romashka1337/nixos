{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = let
      flakeDir = "~/.nixos";
    in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update --flake ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";
      knew = "KUBECONFIG=$HOME/.kube/config-new kubectl";
      kold = "KUBECONFIG=$HOME/.kube/config kubectl";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "tmux"
        "vi-mode"
      ];
      theme = "agnoster"; # blinks is also really nice
    };
    initContent = ''
      # export KUBECONFIG=~/.kube/config:~/.kube/config-new
    '';
  };
}
