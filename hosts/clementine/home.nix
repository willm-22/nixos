{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/shared-desktop.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
