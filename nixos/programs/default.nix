{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./firefox.nix
    # ./codium.nix # I just can't like vscode after vim
    ./spicetify.nix
    ./neovim.nix
  ];

  programs = {
    fastfetch.enable = true;
    hyfetch.enable = true;
    bat.enable = true;
    btop.enable = true;
    fzf.enable = true;
    fish.enable = true;
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    git = {
      enable = true;
      userName = "StarFilledDonut";
      userEmail = "kellyisnothere404@gmail.com";
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    lazygit.enable = true;
    imv.enable = true;
    mpv.enable = true;
    yazi.enable = true;
    zathura.enable = true;
    cava.enable = true;
    java.enable = true;
    obs-studio.enable = true;
  };
}
