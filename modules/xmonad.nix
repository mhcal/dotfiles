{ config, pkgs, ... }:

let
  XMONAD_PATH = "${config.home.homeDirectory}/.dotfiles/config/xmonad";
in
{
  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = null; # setting with a symlink for now to enable `Mod + q` live reload
    };
  };

  home.packages = with pkgs; [
    alsa-utils
    pamixer
    dmenu
    xmobar
    networkmanagerapplet
    alacritty
  ];

  # configure system tray
  services.trayer = {
    enable = true;
    settings = {
      edge = "top";
      align = "right";
      width = 10;
      height = 18;
      SetDockType = true;
      SetPartialStrut = true;
      expand = true;
      transparent = true;
      tint = "0x5f5f5f";
    };
  };

  # symlink xmonad config out-of-store
  xdg.configFile."xmonad/xmonad.hs".source = config.lib.file.mkOutOfStoreSymlink "${XMONAD_PATH}/xmonad.hs";
  xdg.configFile."xmobar/xmobarrc".source = config.lib.file.mkOutOfStoreSymlink "${XMONAD_PATH}/xmobarrc";
  # home.file.".xmobarrc".source = config.lib.file.mkOutOfStoreSymlink "${XMONAD_PATH}/.xmobarrc";
}
