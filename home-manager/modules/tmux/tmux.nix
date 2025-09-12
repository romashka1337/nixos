{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -g default-command ${pkgs.zsh}/bin/zsh
      set -g default-terminal "tmux-256color"
      set -s escape-time 0
      set -g mouse on

      set -g status-style 'bg=#6e6a86 fg=#e0def4'

      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      # this is fucked up
      set -g base-index 2

      set -g renumber-windows on    # renumber windows when a window is closed

      unbind v
      bind v split-window -h
      unbind s
      bind s split-window -v

      bind Q killw
      bind q kill-pane
      bind S choose-session
      bind -n C-l send-keys C-l \; run 'sleep 0.2' \; clear-history # clear both screen and history

      bind -r C-o last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 2

      bind-key -r f run-shell "tmux neww ~/.config/tmux-sessionizer/tmux-sessionizer"
      bind-key -r M-h run-shell "tmux neww ~/.config/tmux-sessionizer/tmux-sessionizer -s 0"

      set-window-option -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
    '';
  };

  home.file = {
    "/.config/tmux-sessionizer/tmux-sessionizer" = {
      text = builtins.readFile ./session.sh;
      executable = true;
    };
    "/.config/tmux-sessionizer/tmux-sessionizer.conf" = {
      text = builtins.readFile ./session.conf;
    };
  };
}
