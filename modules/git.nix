{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "mhcal";
    userEmail = "mhcal@tutanota.com";
    
    extraConfig = {
      init.defaultBranch = "main";
    };

    aliases = {
      st = "status";
    };
  };
}
