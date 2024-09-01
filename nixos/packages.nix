{ lib, pkgs, ... }:

let
  programming = with pkgs; [
    bun
    nodejs
    python3
    gcc
    clang-tools
    gnumake
  ];
  cli = with pkgs; [
    glow
    playerctl
    lsd
    curl
    wget
    zip
    unzip
    p7zip
    imagemagick
    cmatrix
    neo-cowsay
    pipes-rs
    tty-clock
    radeontop
    smartmontools
    appimage-run
    jmtpfs
    xdotool
    ffmpeg
    distrobox
  ];
  gui = with pkgs; [
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
    wtype
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
