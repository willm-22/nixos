{ pkgs, ... }:
{
  home.packages = with pkgs; [
    heroic
    steam
    steam-run
    protonup-qt
    mangohud
    gamemode
    lutris
    olympus
  ];
}
