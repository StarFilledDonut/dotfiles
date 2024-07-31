{ pkgs, spicetify-nix, ... }:

let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      history
      shuffle
      betterGenres
      hidePodcasts
      fullAppDisplay
      beautifulLyrics
      # autoSkipVideo # For skipping ADS if needed
    ];
  };
}
