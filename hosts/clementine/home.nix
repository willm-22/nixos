{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/wm/niri.nix
    ../../modules/home/wm/niri-startup.nix
    ../../modules/home/wm/fuzzel.nix

    ../../modules/home/stylix/stylix.nix

    ../../modules/home/fish.nix
    ../../modules/home/terminal.nix
    ../../modules/home/hyprlock.nix
    ../../modules/home/swww.nix
    ../../modules/home/browser/zen.nix
    ../../modules/home/music/mpd.nix
    ../../modules/home/music/rmpc.nix
    ../../modules/home/packages.nix
    ../../modules/home/services/syncthing.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
