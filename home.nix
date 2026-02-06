{ config, pkgs, ... }:

{
  # Modules
  imports = [
    ./modules/git.nix
    ./modules/emacs.nix
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

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
