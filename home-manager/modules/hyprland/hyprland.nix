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
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
        "base,0xff191724"
        "surface,0xff1f1d2e"
        "overlay,0xff26233a"
        "muted,0xff6e6a86"
        "subtle,0xff908caa"
        "text,0xffe0def4"
        "love,0xffeb6f92"
        "gold,0xfff6c177"
        "rose,0xffebbcba"
        "pine,0xff31748f"
        "foam,0xff9ccfd8"
        "iris,0xffc4a7e7"
        "highlightLow,0xff21202e"
        "highlightMed,0xff403d52"
        "highlightHigh,0xff524f67"
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
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(ffebbcba) rgba(ff31748f) rgba(ffeb6f92) rgba(ffc4a7e7) 90deg";
        "col.inactive_border" = "rgba(ff6e6a86)";
        layout = "dwindle";
      };

      cursor = {
        inactive_timeout = 1;
      };

      decoration = {
        rounding = 10;
      };
      animations = {
        enabled = false;
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

      gesture = [
        "3, horizontal, workspace"
        "3, pinchout, fullscreen"
        "3, pinchin, fullscreen"
      ];

      exec-once = [
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "float, title:.*Developer Tools.*"
        "size 30% 100%, title:.*Developer Tools.*"
      ];

      bind = [
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, RETURN, exec, ghostty"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen,"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, O, exec, firefox"
        "$mainMod, P, pseudo, # dwindle"
        "SUPER_SHIFT, S, exec, hyprshot -m region --clipboard-only"
        "$mainMod, S, exec, hyprshot -m window --clipboard-only"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "SUPER_SHIFT, h, resizeactive, -15 0"
        "SUPER_SHIFT, l, resizeactive, 15 0"
        "SUPER_SHIFT, k, resizeactive, 0 -15"
        "SUPER_SHIFT, j, resizeactive, 0 15"

        "SUPER_CTRL, h, movewindow, left"
        "SUPER_CTRL, l, movewindow, down"
        "SUPER_CTRL, k, movewindow, up"
        "SUPER_CTRL, j, movewindow, right"

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
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );
    };
  };
}
