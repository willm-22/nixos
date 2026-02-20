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
    ../../modules/home/music/mpdscribble.nix
    ../../modules/home/music/rmpc.nix
    ../../modules/home/packages.nix
    ../../modules/home/services/syncthing.nix
    ../../modules/home/obsidian.nix
    ../../modules/home/gui_pkgs.nix
    ../../modules/home/yazi.nix
    ../../modules/home/anki.nix
    ../../modules/home/shared_pkgs.nix
    ../../modules/home/environment-variables.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
