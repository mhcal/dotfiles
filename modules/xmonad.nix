{ config, pkgs, ... }:

{
  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = builtins.readFile ../config/xmonad/xmonad.hs;
      enableConfiguredRecompile = true;
    };
  };
}
