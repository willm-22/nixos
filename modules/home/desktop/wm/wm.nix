{ config, pkgs, lib, ... }:
{
  imports = [
    ./hyprlock.nix
    ./niri.nix
    ./niri-startup.nix
  ];
}
