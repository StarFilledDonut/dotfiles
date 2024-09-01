{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top"; # Waybar at top layer
        "position" = "top"; # Waybar position (top|bottom|left|right)
        "mode" = "dock";
        "reload_style_on_change" = true;
        "exclusive" = true;
        "passthrough" = false;
        "gtk-layer-shell" = true;
        # "height" = 40; # Waybar height (to be removed for auto height)
        # "width" = 1280; # Waybar width
        # "spacing" = 4; # Gaps between modules (4px)
        # Choose the order of the modules
        "modules-left" = ["hyprland/workspaces" "hyprland/window"];
        "modules-center" = ["clock"];
        "modules-right" = ["network" "tray"];
        # Modules configuration
        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "warp-on-scroll" = false;
          "format" = "{icon} {windows}";
          "format-window-separator" = " ";
          "window-rewrite-default" = " ";
          "window-rewrite" = {
            "title<.*youtube.*>" = " ";
            "title<.*/ X.*>" = " ";
            "title<.*WhatsApp.*>" = "󰖣 ";
            "title<.*Spotify.*>" = " ";
            "title<.*NixOs Wiki.*>" = " ";
            "title<.*amazon.*>" = " ";
            "title<.*reddit.*>" = " ";
            "title<.*Picture-in-Picture.*>" = " ";
            "title<.*Popout>" = " ";
            "title<.*yazi.*>" = "󰝰 ";
            "title<.*git.*>" = "󰊤 ";
            "title<RetroArch.*>" = "󰯉 ";
            "class<firefox>" = " ";
            "class<kitty>" = " ";
            "class<discord>" = " ";
            "class<vesktop>" = " ";
            "class<steam>" = "󰓓 ";
            "class<subl>" = "󰅳 ";
            "class<celluloid>" = " ";
            "class<Cider>" = "󰎆 ";
            "class<code>" = "󰨞 ";
            "class<.*VS.*>" = "󰨞 ";
            "class<dev.zed.Zed-Preview>" = " ";
            "class<spotify>" = " ";
            "class<codeblocks>" = "󰅩 ";
            "class<org.larusstone.qtspim>" = " ";
            "class<libreoffice-writer>" = " ";
            "class<libreoffice-startcenter>" = "󰏆 ";
            "class<mpv>" = " ";
          };
        };
        "hyprland/window" = {
          "format" = "{initialTitle}";
          "separate-outputs" = true;
        };
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{name} {icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };
        "sway/mode" = {
          "format" = "<span style =\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          "format" = "{icon} {count}";
          "show-empty" = false;
          "format-icons" = ["" ""];
          "tooltip" = true;
          "tooltip-format" = "{app}: {title}";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 10;
        };
        "clock" = {
          "timezone" = "America/Maceio";
          "format" = " {:%I:%M}";
          "format-alt" = "{:%A  |  %I:%M  | %e %B}";
          "on-scroll-up"  = "pamixer -i 2 --allow-boost =true --set-limit =100";
          "on-scroll-down"  = "pamixer -d 2 --allow-boost =true --set-limit =100";
# "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
        };
        "cpu" = {
          "format" = "{usage}% ";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}% ";
        };
        "temperature" = {
# "thermal-zone" = 2;
# "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "critical-threshold" = 80;
# "format-critical" = "{temperatureC}°C {icon}";
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = [" " "" " "];
        };
        "backlight" = {
          "device" = "amdgpu_bl2";
          "format" = "{percent}%  {icon} ";
          "format-icons" = ["󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
          "on-scroll-up" = "brightnessctl --device =amdgpu_bl2 set 1%+";
          "on-scroll-down" = "brightnessctl --device =amdgpu_bl2 set 1%-";
          "on-click" = "brightnessctl --device-amdgpu_bl2 set 50";
          "min-length" = 6;
          "scroll-step" = 0.5;
          "reverse-scrolling" = true;
          "tooltip" = false;
        };
        "battery" = {
          "bat" = "BAT0";
          "states" = {
            "good" = 85;
            "warning" = 40;
            "critical" = 20;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% 󰂄";
          "format-plugged" = "{capacity}% 󰚥";
          "format-alt" = "{power:0.1f}W {icon}";
          "tooltip" = false;
# "format-good" = ""; # An empty format will hide the module
# "format-full" = "";
          "format-icons" = ["" "" "" "" ""];
# "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"]
        };
        "network" = {
# "interface" = "wlp2*"; # (Optional) To force the use of this interface
          "interval" = 2;
          "format-wifi" = " {bandwidthDownBits}";
          "format-ethernet" = "󰈀  Ethernet";
          "tooltip" = false;
          "format-linked" = "󰤭  {ifname} | No IP";
          "format-disconnected" = "󰤭  Disconnected";
          "format-alt" = "{icon} {essid}";
          "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          "on-click-right" = "kitty nmtui";
        };
        "pulseaudio" = {
# "scroll-step"  = 1;
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{icon}  {volume}%";
          "format-bluetooth-muted" = "󰟎   Mute";
          "format-muted" = "󰝟  Mute";
          "format-icons" = {
            "headphone" = "󰋋 ";
            "hands-free" = " ";
            "headset" = " ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = ["󰕿" "󰖀" "󰖀" "󰕾"];
          };
          "on-click" = "pamixer -t";
          "on-click-right" = "kmix";
          "on-scroll-up" = "pamixer -i 1";
          "on-scroll-down" = "pamixer -d 1";
          "reverse-scrolling" = true;
          "scroll-step" = 0.5;
        };
        "pulseaudio#microphone" = {
          "format" = "{format_source}";
          "format-source" = "  {volume}%";
          "format-source-muted" = "";
          "on-click" = "pamixer --default-source -t";
          "on-scroll-up" = "pamixer --default-source -i 2";
          "on-scroll-down" = "pamixer --default-source -d 2";
          "scroll-step" = 2;
          "tooltip" = false;
        };
        "custom/weather"  = {
# shows the current weather and forecast
          "tooltip"  = true;
          "format"  = "{}";
          "interval"  = 30;
          "exec"  = "~/.config/waybar/scripts/waybar-wttr.py";
          "return-type"  = "json";
        };

        "custom/vpn" = {
          "format" = "VPN ";
          "exec" = "echo '{\"class\": \"connected\"}'";
          "exec-if" = "test -d /proc/sys/net/ipv4/conf/tun0";
          "return-type" = "json";
          "interval" = 5;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0px;
        /* `otf-font-awesome` is required to be installed for icons */
        /* font-family: 'NotoSans Nerd Font', FontAwesome, Roboto, Helvetica, Arial, sans-serif; */
        font-family: "jetbrainsMono Nerd Font Propo";
        /* font-family: "FiraCode Nerd Font"; */
        font-size: 14px;
        font-weight: bold;
        min-height: 0;
        transition: 0.3s;
      }

      window#waybar {
        background-color: transparent;
        color: #cba6f7;
        padding-left: 15px;
        padding-right: 15px;
      }

      window#waybar.empty #window {
        background-color: transparent;
        border-color: transparent;
        padding-left: 15px;
        padding-right: 15px;
      }

      tooltip {
        background: #1e1e2e;
        color: #a6adc8;
        border-radius: 10px;
        border-width: 1.5px;
        border-style: solid;
        border-color: #fab387;
        transition: 0.3s;
        opacity: 0.9;
      }

      #workspaces button {
        padding: 5px;
        color: #585b70;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #b4befe;
        background: #313244;
        border-radius: 20px;
      }

      #workspaces button.focused {
        color: #a6adc8;
        background: #313244;
        border-radius: 20px;
      }

      #workspaces button.urgent {
        color: #f38ba8;
        background: #f38ba8;
        border-radius: 20px;
      }

      #workspaces button:hover {
        background: #313244;
        color: #cdd6f4;
        border-radius: 20px;
      }

      #workspaces button.empty {
        background-color: transparent;
        border-color: transparent;
      }

      #custom-power_profile,
      #custom-weather,
      #custom-vpn,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #workspaces,
      #tray,
      #backlight {
        background: #191724;
        opacity: 1;
        padding: 0px 10px;
        margin: 0;
        margin-top: 5px;
      }

      #temperature {
        border-radius: 20px 0px 0px 20px;
      }

      #temperature.critical {
        color: #eba0ac;
      }

      #backlight {
        color: #f9e2af;
      /*
        border-radius: 20px 0px 0px 20px;
        border-left: 0px;
        border-right: 0px;
      */
        border-left: 0px;
        border-top: 2px solid #89b4fa;
        border-right: 2px solid #89b4fa;
        border-bottom: 2px solid #89b4fa;
        border-radius: 0px 20px 20px 0px;
        margin-right: 5px;
        padding-right: 10px;
      }
      #tray {
        border-radius: 20px;
        margin-right: 5px;
      /*    padding: 0px 4px; */
        padding-left: 15px;
        padding-right: 15px;
        border: 2px solid #a6adc8;
      }

      #tray.empty {
        background-color: transparent;
        border-color: transparent;
        border: 0px;
      }

      #workspaces {
        border-radius: 20px;
        margin-left: 5px;
        padding-right: 0px;
        padding-left: 5px;
        border: 2px solid #a6adc8;
      }

      #custom-power_profile {
        color: #a6e3a1;
        border-left: 0px;
        border-right: 0px;
      }

      #window {
        border-radius: 20px;
        margin-left: 5px;
        margin-right: 5px;
        border: 2px solid #cba6f7;
      }

      #clock {
        color: #fab387;
        border-radius: 20px;
        margin-left: 5px;
        border-right: 0px;
        transition: 0.3s;
        padding-right: 13px;
        padding-left: 13px;
        border: 2px solid #fab387;
      }

      #network {
        color: #cba6f7;
        border-radius: 20px;
        padding-left: 15px;
        border-left: 2px solid #cba6f7;
        border-top: 2px solid #cba6f7;
        border-right: 2px solid #cba6f7;
        border-bottom: 2px solid #cba6f7;
        margin-right: 5px;
      }

      #network.disconnected {
        color: #f5c2e7;
        border-left: 2px solid #cba6f7;
        border-top: 2px solid #cba6f7;
        border-right: 2px solid #cba6f7;
        border-bottom: 2px solid #cba6f7;
      }

      #bluetooth {
        color: #b4befe;
        border-radius: 20px;
        margin-right: 10px
      } 

      #pulseaudio {
        color: #89b4fa;
        border-left: 0px;
        border-top: 2px solid #89b4fa;
        border-right: 2px solid #89b4fa;
        border-bottom: 2px solid #89b4fa;
        border-radius: 0px 20px 20px 0px;
        margin-right: 5px;
        padding-right: 10px;
      }

      #pulseaudio.microphone {
        color: #b4befe;
        border-radius: 20px 0px 0px 20px;
        border-left: 2px solid #89b4fa;
        border-top: 2px solid #89b4fa;
        border-right: 0px;
        border-bottom: 2px solid #89b4fa;
        padding-left: 15px;
      }

      #pulseaudio.muted {
        color: #f38ba8;
      }

      #battery {
        color: #a6e3a1;
        border-radius: 0 20px 20px 0;
        margin-right: 5px;
        padding-right: 15px;
        border-left: 0px;
        border-top: 2px solid #cba6f7;
        border-right: 2px solid #cba6f7;
        border-bottom: 2px solid #cba6f7;
      }


      #battery.good {
        color: #cba6f7;
        border-left: 0px;
        border-top: 2px solid #cba6f7;
        border-right: 2px solid #cba6f7;
        border-bottom: 2px solid #cba6f7;
      }

      #battery.warning {
        color: #f38ba8;
        border-left: 0px;
        border-top: 2px solid #cba6f7;
        border-right: 2px solid #cba6f7;
        border-bottom: 2px solid #cba6f7;
      }

      #battery.charging {
        color: #a6e3a1;
      }

      #battery.critical {
        color: #f38ba8;
        border-left: 0px;
        border-top: 2px solid #cba6f7;
        border-right: 2px solid #cba6f7;
        border-bottom: 2px solid #cba6f7;
      }

      #custom-weather {
        color: #8eacf3;
        border-radius: 20px;
        border-right: 0px;
        margin-left: 0px;
        margin-right: 5px;
      }

      #custom-vpn {
        color: #f5c2e7;
        border-radius: 20px;
        border: 2px solid #f5c2e7;
        margin-left: 0px;
        margin-right: 5px;
        padding-left: 15px;
        padding-right: 15px;
      }
    '';
  };
}
