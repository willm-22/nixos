{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/common.nix
    ../../modules/home/desktop.nix
  ];

  home.username = "will";
  home.homeDirectory = "/home/will";
  home.stateVersion = "25.11";
}
