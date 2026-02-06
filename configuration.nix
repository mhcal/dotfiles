{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix # 
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ]; # workaround: disable kvm for virtualbox

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Timezone and locale
  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Virtualization
  virtualisation = {
    docker.enable = true;
    podman.enable = true;
    virtualbox.host.enable = true;
  };

  # Services
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,br";
      variant = "altgr-intl,thinkpad";
      options = "grp:win_space_toggle";
    };
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 17d";
  };

  # Display manager
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Gnome
  services.desktopManager.gnome.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Users
  users.users.calcado = {
    isNormalUser = true;
    description = "calcado";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.extraGroups.vboxusers.members = [ "calcado" ];

  # QMK
  services.udev.packages = with pkgs; [ qmk qmk-udev-rules qmk_hid via vial ];
  hardware.keyboard.qmk.enable = true;

  # Graphics
  hardware.graphics.enable = true;

  # Printing
  services.printing.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    gcc
    gnumake
    ripgrep
    fd
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
