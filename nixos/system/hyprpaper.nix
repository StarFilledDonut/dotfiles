{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = "$HOME/dotfiles/nixos/assets/catppuccin/waves-wallpaper.png";
      wallpaper = ",$HOME/dotfiles/nixos/assets/catppuccin/waves-wallpaper.png";
    };
  };
}
