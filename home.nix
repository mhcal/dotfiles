{ config, pkgs, ... }:

{
  # Modules
  imports = [
    ./modules/git.nix
    ./modules/emacs.nix
    ./modules/xmonad.nix
    ./modules/vim.nix
    ./modules/bash.nix
    ./modules/direnv.nix
  ];

  xsession.enable = true;

  # User configuration
  home.username = "calcado";
  home.homeDirectory = "/home/calcado";
  home.stateVersion = "24.11";

  # Allow unfree packages in Home Manager
  nixpkgs.config.allowUnfree = true;

  # Packages
  home.packages = with pkgs; [
    hello
    #lightlocker
    gh
    ghc
    chromium
    zathura
    zip
    unzip
    qbittorrent
    distrobox
    mpv
    discord
    qmk
    via
    vial
  ];

  # Auto-lock and idle sleep
  programs.xss-lock = {
    enable = true;
    # lockerCommand = ""
  };


  services.xidlehook = {
    enable = true;
    detect-sleep = true;
    not-when-audio = true;
    timers = [
      {
        delay = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
