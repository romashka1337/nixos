{
  pkgs,
  config,
  ...
}:
let
  powerlevel10k = pkgs.fetchFromGitHub {
    owner = "romkatv";
    repo = "powerlevel10k";
    rev = "master";
    hash = "sha256-BRJyGn+gTGUWifpJ1ziBKVHACcWw+R5N/HdUi8HzSvY=";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/.nixos";
      in
      {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "nix flake update --flake ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        hms = "home-manager switch --flake ${flakeDir}";

        knew = "KUBECONFIG=$HOME/.kube/config-new kubectl";
        kold = "KUBECONFIG=$HOME/.kube/config kubectl";
        linker = "linkerd --kubeconfig ~/.kube/config-new";
        vim = "nvim";
        tmuxa = "tmux new-session -A -s home";
      };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    initContent = ''
      source ${powerlevel10k}/powerlevel10k.zsh-theme;
      source ~/.config/zsh/pl10k
    '';
  };
  home.file = {
    "/.config/zsh/pl10k" = {
      text = builtins.readFile ./pl10k;
    };
  };
}
