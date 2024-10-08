# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      devices = [ "nodev" ];
      catppuccin.enable = true;
    };
  };
  boot.initrd.kernelModules = [ "amdgpu" ];

  networking = {
    hostName = "nixos"; # Define your hostname.
    enableIPv6 = false;
    networkmanager.enable = true; # Enable network
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };

  time.timeZone = "America/Maceio";

  i18n.defaultLocale = "en_US.UTF-8"; # Internationalisation properties.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  hardware = {
    # Enable sound with pipewire.
    # This conflicts with pipewire, so choose one.
    pulseaudio.enable = false;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ amdvlk rocmPackages.clr.icd ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };
  };
  security.rtkit.enable = true;

  services = {
    xserver = {
      enable = true;
      xkb.layout = "br"; # Configure keymap in X11
      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;
      desktopManager.retroarch = {
        enable = true;
        package = pkgs.retroarchFull;
      };
      videoDrivers = [ "amdgpu" ];
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        catppuccin.enable = true;
        catppuccin.background = "${./assets/catppuccin/nix-stripe-wallpaper.png}";
      };
      defaultSession = "hyprland";
    };
    openssh.enable = true; # Enable the OpenSSH daemon.
    openssh.settings.PasswordAuthentication = true;
    power-profiles-daemon.enable = true; # Power management
    udisks2.enable = true; # Auto mount removable meadia
    gvfs.enable = true;
    dbus.enable = true; # Inter Process Comunication between diferent processes
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    rkvm.enable = true;
    scrutiny.enable = true; # Enable drive monitoring
    blueman.enable = true;
    snap.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    ydotool.enable = true;
    firefox.enable = true;
    steam.enable = true;
    fish.enable = true;
    virt-manager.enable = true;
    dconf.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";
  console.catppuccin.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.star = {
    isNormalUser = true;
    description = "star";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = [];
    shell = pkgs.fish;
  };

  nixpkgs.config = {
    allowUnfree = true;
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
  };

  environment = {
    variables = { ROC_ENABLE_PRE_VEGA = "1"; };
    systemPackages = with pkgs; [
      neovim
      kitty
      wl-clipboard
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
      adwaita-icon-theme
    ];
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      ubuntu_font_family
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Ubuntu" ];
      monospace = [ "Ubuntu Monospace" ];
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = { 
    stateVersion = "24.05"; # Did you read the comment?
    autoUpgrade = {
      enable = true;
      dates = "daily";
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
