{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/shared-desktop.nix
    ../../modules/home/clementine.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
