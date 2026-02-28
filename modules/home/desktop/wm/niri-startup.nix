{ pkgs, ... }:
{
  programs.niri.settings.spawn-at-startup = [
    { command = ["swww" "img" "~/nixos/modules/nixos/desktop/stylix/Wallpapers/forest1.jpg"]; }
  ];
}
