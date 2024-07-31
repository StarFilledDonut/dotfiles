{
  description = "Kelly's NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, spicetify-nix, nixvim, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    inherit (self) outputs;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.star = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs outputs pkgs; };
      modules = [ ./nixos/configuration.nix ];
    };
    homeConfigurations.star = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs spicetify-nix; };
      modules = [
        ./nixos/home.nix
        catppuccin.homeManagerModules.catppuccin
        spicetify-nix.homeManagerModules.default
        nixvim.homeManagerModules.nixvim
      ];
    };
  };
}
