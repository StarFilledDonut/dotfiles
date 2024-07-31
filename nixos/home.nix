{ config, pkgs, inputs, ... }:

{
  imports = [ ./default.nix ];

  home = {
    username = "star";
    homeDirectory = "/home/star";
    stateVersion = "24.05"; # Please read the release notes before changing. Know what you are doing.
    file = {};
    # sessionVariables = { XDG_CONFIG_HOME = "$HOME/.config"; };
    shellAliases = {
      hyfetch = "hyfetch -b fastfetch";
    };
  };

  gtk.enable = true;
  qt.enable = true;

  fonts.fontconfig.enable = true;

  services = { glance.enable = true; };

  programs.home-manager.enable = true; # Let home-manager manage itself
}
