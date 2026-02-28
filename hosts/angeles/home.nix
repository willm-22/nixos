{ config, pkgs, ... }:

{
  imports = [
    ./outputs.nix
    
    ../../modules/home/common.nix
    ../../modules/home/desktop.nix

    ../../modules/home/desktop/music/mpd.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
