{ lib, pkgs, ... }:

let
  programming = with pkgs; [
    bun
    nodejs
    python3
    gcc
    clang-tools
    gnumake
    ncurses
  ];
  cli = with pkgs; [
    glow
    playerctl
    lsd
    curl
    wget
    zip
    unzip
    imagemagick
    cmatrix
    neo-cowsay
    pipes-rs
    tty-clock
    radeontop
    smartmontools
    appimage-run
  ];
  gui = with pkgs; [
    # zed-editor # It's good, just not neovim
    vesktop
    lutris
    pavucontrol
    blender-hip
    godot_4
    krita
    gnome-disk-utility
    nautilus
    ventoy
    stremio
  ];
  desktop = with pkgs; [
    waybar
    rofi-wayland
    wl-clipboard
    grim
    slurp
  ];
  fonts = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Noto" ]; })
    morewaita-icon-theme
  ];
in {
  home.packages = lib.mkMerge [
    programming
    cli
    gui
    desktop
    fonts
  ];
}
