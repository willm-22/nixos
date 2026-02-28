{ config, pkgs, ... }:
{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  environment.systemPackages = with pkgs; [ xwayland-satellite ];
}
