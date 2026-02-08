{ config, pkgs, ... }:

let
  EMACS_PATH = "${config.home.homeDirectory}/.dotfiles/config/emacs";
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs; # lucid toolkit
  };

  # symlink emacs config out-of-store
  xdg.configFile."emacs/init.el".source = config.lib.file.mkOutOfStoreSymlink "${EMACS_PATH}/init.el";
}
