{
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "$HOME/.config/hypr/mocha.conf";

      "$accent" = "$mauve";
      "$accentAlpha" = "$mauveAlpha";
      "$font" = "Noto Sans";
      "$assets" = "$HOME/dotfiles/nixos/assets/catppuccin";

      # GENERAL
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      # BACKGROUND
      background = {
        monitor = "";
        # path = "$assets/lock-background.png";
        blur_passes = 0;
        color = "$base";
      };

      label = [
        # TIME
        {
          monitor = "";
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "$text";
          font_size = 70;
          font_family = "$font";
          position = "-85, -30";
          halign = "right";
          valign = "top";
        }

        # DATE 
        {
          monitor = "";
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "$text";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # USER AVATAR
      image = {
        monitor = "";
        path = "$assets/logo.png";
        size = 100;
        border_color = "$accent";
        border_size = 2;

        position = "0, 75";
        halign = "center";
        valign = "center";
      };

      # INPUT FIELD
      input-field = {
        monitor = "";
        size = "300, 40";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$accent";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = ''<span foreground="##$textAlpha">󰌾  Logged in as <span foreground="##$accentAlpha">$USER</span></span>'';
        hide_input = false;
        check_color = "$accent";
        fail_color = "$red";
        fail_text = "<i>$FAIL </i>";
        capslock_color = "$yellow";
        position = "0, -35";
        halign = "center";
        valign = "center";
      };
    };
  };
}
