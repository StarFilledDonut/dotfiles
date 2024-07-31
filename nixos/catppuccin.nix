{ pkgs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    pointerCursor.enable = true;
  };

  home = {
    pointerCursor = {
      name = "catppuccin-mocha-mauve-cursors";
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };
  };

  gtk = {
    catppuccin = {
      enable = true;
      icon = {
        enable = true;
        flavor = "mocha";
        accent = "mauve";
      };
    };
  };

  qt = {
    style.name = "kvantum";
    platformTheme.name = "kvantum";
    style.catppuccin.enable = true;
    style.catppuccin.apply = true;
  };
  
  programs = {
    bat.catppuccin.enable = true;
    btop.catppuccin.enable = true;
    fzf.catppuccin.enable = true;
    glamour.catppuccin.enable = true;
    kitty.catppuccin.enable = true;
    lazygit.catppuccin.enable = true;
    imv.catppuccin.enable = true;
    mpv.catppuccin.enable = true;
    starship.catppuccin.enable = true;
    yazi.catppuccin.enable = true;
    zathura.catppuccin.enable = true;
  };

  wayland.windowManager.hyprland.catppuccin.enable = true;
}
