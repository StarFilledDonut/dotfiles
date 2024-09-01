{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # https://wiki.hyprland.org/Configuring/Configuring-Hyprland/

      # PROGRAMS
      "$terminal" = "kitty";
      "$fileManager" = "yazi";
      "$menu" = "rofi -icon-theme MoreWaita -show-icons -show drun";

      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      # MONITORS
      monitor=",preferred,auto,auto";

      # AUTOSTART
      # exec-once = "nm-applet &";
      exec-once = "waybar &";
      
      # LOOK AND FEEL
      general = { 
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          "col.active_border" = "$mauve $peach 45deg";
          "col.inactive_border" = "$base";
          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false;
          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false;
          layout = "dwindle";
      };

      decoration = {
          rounding = 10;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
          };
      };

      animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      };

      dwindle = {
          pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # You probably want this
      };

      master = {
          new_status = "master";
      };

      misc = { 
          disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
	  disable_splash_rendering = true;
      };


      # INPUT
      input = {
          kb_layout = "br";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";

          follow_mouse = 1;

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

          touchpad = {
              natural_scroll = false;
          };
      };

      gestures = {
          workspace_swipe = false;
      };

      device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
      };

      # BINDINGS
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive"
        "$mainMod, E, exec, $terminal $fileManager"
        "$mainMod, F, fullscreen"
        "$mainMod, V, togglefloating"
        "$mainMod, M, exec, $menu"
        "$mainMod, P, pseudo" # dwindle
        "$mainMod, R, togglesplit" # dwindle
        ", Print, exec, grim"
        "$mainMod, Print, exec, grim -g \"$(slurp)\" - | magick - -shave 1x1 $HOME/Pictures/$(date '+%Y%m%d_%Hh%Mm%S').png"
        "$mainMod, W, exec, wlogout"
        "$mainMod, L, exec, hyprlock"
        # Move focus
        "Alt, H, movefocus, l"
        "Alt, L, movefocus, r"
        "Alt, J, movefocus, u"
        "Alt, K, movefocus, d"
        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Move active window to a workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # WINDOWS AND WORKSPACES

      # Example windowrule v1
      # windowrule = float, ^(kitty)$

      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.
    };
  };
}
