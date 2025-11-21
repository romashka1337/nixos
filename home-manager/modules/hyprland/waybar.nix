{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "hyprland/workspaces"
          # "hyprland/language"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "memory"
          "bluetooth"
          "battery"
          "network"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            active = "";
            default = "";
          };
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ru = "RU";
          min-length = 2;
          tooltip = false;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a; %d, %I:%M %p}";
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " ";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
          min-length = 7;
          max-length = 7;
        };

        memory = {
          interval = 5;
          format = "  {used:0.1f}G/{total:0.1f}G";
          tooltip = false;
        };

        bluetooth = {
          "format-on" = "󰂯";
          "format-connected" = "󰂱";
          "format-connected-battery" = "󰂱 {device_battery_percentage}%";
          "format-off" = "󰂲";
          "on-click" = "hyprctl dispatch exec [float] 'ghostty -e bluetuith'";
        };

        network = {
          interface = "wlp1s0";

          format-wifi = "{essid} 󰤢 ";
          format-ethernet = "󰈀 ";
          format-disconnected = "󰤠 ";
          interval = 5;
          format = "{ifname}";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          tooltip-format-wifi = "{essid} ({signalStrength}%) 󰤢";
          tooltip-format-ethernet = "{ifname} 󰈀";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}%";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% ";
          format-alt = "{time}";
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };
  };
  home.file = {
    "/.config/waybar/style.css" = {
      text = builtins.readFile ./waybar.css;
    };
  };
}
