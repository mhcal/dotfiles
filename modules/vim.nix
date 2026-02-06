{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    
    settings = {
      ignorecase = true;
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
    };

    extraConfig = ''
      syntax on
      set mouse=a
      set autoindent
      set hlsearch
      au FileType c,cpp setlocal et ts=4 sw=4 sts=4
    '';
  };
}
