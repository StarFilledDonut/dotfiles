{
  programs.kitty = {
    enable = true;
    font.name = "FiraCode Nerd Font";
    environment = {
      "EDITOR" = "nvim";
      "TERM" = "kitty";
    };
    extraConfig = ''
      confirm_os_window_close 0
      background_opacity 0.9
      dynamic_background_opacity yes
    '';
  };
}
