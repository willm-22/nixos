{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/shared-desktop.nix
    ../../modules/home/wm/outputs-angeles.nix
    ../../modules/home/music/mpd.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
