{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos/shared-desktop.nix
    ];

  networking = {
    hostName = "clementine";
    networkmanager.enable = true;
  };

  system.stateVersion = "25.11"; 

}
