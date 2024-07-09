{
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -g default-terminal "screen-256color"

      setw -g xterm-keys on
      set -s escape-time 0                      # faster command sequences
      # set -sg repeat-time 600                   # increase repeat timeout
      set -s focus-events on

      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
      setw -q -g utf8 on

      set -g history-limit 5000                 # boost history

      bind q killw

      set-option -ga terminal-overrides "alacritty:Tc"
      # -- display -------------------------------------------------------------------

      set -g base-index 1           # start windows numbering at 1
      setw -g pane-base-index 1     # make pane numbering consistent with windows

      setw -g automatic-rename on   # rename window to reflect current program
      set -g renumber-windows on    # renumber windows when a window is closed

      set -g set-titles on          # set terminal title

      set -g display-panes-time 800 # slightly longer pane indicators display time
      set -g display-time 1000      # slightly longer status messages display time

      set -g status-interval 10     # redraw status line every 10 seconds

      # clear both screen and history
      bind -n C-l send-keys C-l \; run 'sleep 0.2' \; clear-history

      # activity
      set -g monitor-activity on
      set -g visual-activity on

      set -g mouse on

      bind-key -r f run-shell "tmux neww ~/tmux/tmux-sessionizer"

      unbind '"'
      bind \\ split-window -v
      unbind %
      bind | split-window -h

      # pane navigation
      bind -r h select-pane -L  # move left
      bind -r j select-pane -D  # move down
      bind -r k select-pane -U  # move up
      bind -r l select-pane -R  # move right
      bind > swap-pane -D       # swap current pane with the next one
      bind < swap-pane -U       # swap current pane with the previous one

      # pane resizing
      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 2

      unbind n
      unbind p

      # vi mode
      set -g mode-keys vi
      setw -g mode-keys vi
      set-window-option mode-keys vi

      bind [ copy-mode

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
    '';
  };
}
