{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.morewaita-icon-theme;
    settings = {
      global = {
        rounded = "yes";
        corner_radius = 10;
        frame_color = "#89b4fa";
	frame_width = 2;
        separator_color= "frame";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };
}
