{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "6 13 -12 13";

        modules-left = ["hyprland/workspaces" "hyprland/language"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "custom/mem" "cpu" "backlight" "battery" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ru = "RU";
          min-length = 5;
          tooltip = false;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
          format = "{:%a; %d %b, %I:%M %p}";
        };

        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = [""];
          min-length = 7;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" "" "" "" "" "" ""];
          on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: JetBrains Mono;
          font-weight: bold;
          min-height: 20px;
      }

      window#waybar {
          background: transparent;
      }

      window#waybar.hidden {
          opacity: 0.5;
      }

      #workspaces {
          margin-right: 8px;
          border-radius: 10px;
          transition: none;
          background: #383c4a;
      }

      #workspaces button {
          transition: none;
          color: #7c818c;
          background: transparent;
          padding: 5px;
          font-size: 18px;
      }

      #workspaces button.persistent {
          color: #7c818c;
          font-size: 12px;
      }

      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: #383c4a;
          background: #7c818c;
      }

      #workspaces button.active {
          background: #4e5263;
          color: white;
          border-radius: inherit;
      }

      #language {
          padding-left: 16px;
          padding-right: 8px;
          border-radius: 10px 10px 10px 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #clock {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px 10px 10px 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #pulseaudio {
          margin-right: 0px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px 0px 0px 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #pulseaudio.muted {
          background-color: #90b1b1;
          color: #2a5c45;
      }

      #custom-mem {
          margin-right: 0px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 0px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #cpu {
          margin-right: 0px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 0px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #temperature {
          margin-right: 0px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 0px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }

      #backlight {
          margin-right: 0px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 0px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #battery {
          margin-right: 0px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 0px 10px 10px 0px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #battery.charging {
          color: #ffffff;
          background-color: #26A65B;
      }

      #battery.warning:not(.charging) {
          background-color: #ffbe61;
          color: black;
      }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          /*animation-name: blink;*/
          /*animation-duration: 0.5s;*/
          /*animation-timing-function: linear;*/
          /*animation-iteration-count: infinite;*/
          /*animation-direction: alternate;*/
      }

      #tray {
          margin-left: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 5px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }
    '';
  };
}
