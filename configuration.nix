{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix # 
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 17d";
  };

  # Virtualization
  virtualisation = {
    docker.enable = true;
    podman.enable = true;
    virtualbox.host.enable = true;
  };
  # workaround: disable kvm for virtualbox
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  # Xserver
  services.xserver.enable = true;

  # Keyboard
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # Touchpad
  services.libinput.enable = true;
  services.libinput.touchpad = {
    naturalScrolling = true;
    tapping = true;
    tappingDragLock = false;
    middleEmulation = true;
    accelProfile = "adaptive";
  };

  # Display manager
  services.xserver.displayManager.lightdm.enable = true;

  # Lid and powerkey behavior
  services.logind.settings.Login = {
    HandlePowerKey = "suspend-then-hibernate";
    HandlePowerKeyLongPress = "poweroff";
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "lock";
  };

  # Xmonad
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth 
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  # TLP
  services.tlp.enable = true;

  # Users
  users.users.calcado = {
    isNormalUser = true;
    description = "calcado";
    extraGroups = [ "networkmanager" "wheel" ];
  };

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
