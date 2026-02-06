{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # Silencing "loading" message
    # config.global.hide_env_diff = true; 
  };
  
  # Global gitignore
  programs.git.ignores = [ ".direnv" ".envrc" ];
}
