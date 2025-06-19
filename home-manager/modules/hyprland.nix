{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$mainMod" = "SUPER";

      # monitor = [
      #   "eDP-1,1920x1080@60,2000x2000,1"
      #   "HDMI-A-1,2560x1440@144,3920x520,1,transform,1"
      # ];
      monitor = [
        "eDP-1,1920x1080@60,2000x2000,1"
        "HDMI-A-1,2560x1440@144,560x520,1,transform,1"
      ];

      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:HDMI-A-1"
        "7, monitor:HDMI-A-1"
        "8, monitor:HDMI-A-1"
        "9, monitor:HDMI-A-1"
        "10, monitor:HDMI-A-1"
        # "6, monitor:eDP-1"
        # "7, monitor:eDP-1"
        # "8, monitor:eDP-1"
        # "9, monitor:eDP-1"
        # "0, monitor:eDP-1"
        # "1, monitor:HDMI-A-1"
        # "2, monitor:HDMI-A-1"
        # "3, monitor:HDMI-A-1"
        # "4, monitor:HDMI-A-1"
        # "5, monitor:HDMI-A-1"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        # "XCURSOR_SIZE,12"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      input = {
        kb_layout = "us,ru";
        # kb_variant = "qwerty,qwerty";
        kb_options = "grp:win_space_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        gaps_in = 0;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      cursor = {
        inactive_timeout = 1;
      };

      decoration = {
        rounding = 10;

        # blur = {
        #   enabled = true;
        #   size = 16;
        #   passes = 2;
        #   new_optimizations = true;
        # };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        smart_resizing = false;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_create_new = false;
      };

      exec-once = [
        "swww init"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        # "hyprpolkitagent"
      ];

      bind =
        [
          "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
          "$mainMod, RETURN, exec, alacritty -e tmux new-session -A -s home"
          "$mainMod, Q, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod, D, exec, wofi --show drun"
          "$mainMod, O, exec, google-chrome-stable"
          "$mainMod, P, pseudo, # dwindle"
          "SUPER_SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          # Volume and Media Control
          ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
          ", XF86AudioLowerVolume, exec, pamixer -d 5 "
          ", XF86AudioMute, exec, pamixer -t"
          ", XF86AudioMicMute, exec, pamixer --default-source -t"

          # Brightness control
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
          ", XF86MonBrightnessUp, exec, brightnessctl set +5% "
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mainMod, code:1${toString i}, workspace, ${toString ws}"
                "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
