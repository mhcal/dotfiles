{ config, pkgs, ... }:

let
  EMACS_PATH = "${config.home.homeDirectory}/.dotfiles/config/emacs";
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs; # lucid toolkit
  };

  # enable emacs as a daemon
  services.emacs = {
    enable = true;
    defaultEditor = true;

    # probably not ideal but necessary to get emacs to wait for the graphical environment
    startWithUserSession = false;
    socketActivation.enable = true;
  };

  # symlink emacs config out-of-store
  home.file.".emacs.d/init.el".source = config.lib.file.mkOutOfStoreSymlink "${EMACS_PATH}/init.el";
}
