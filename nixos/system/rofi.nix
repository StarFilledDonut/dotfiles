{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    catppuccin.enable = true;
    # theme = "Catppuccin-Mocha";
    font = "Noto Sans";
  };
}
