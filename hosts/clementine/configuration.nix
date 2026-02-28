{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos/common.nix
      ../../modules/nixos/desktop.nix

      ../../modules/nixos/desktop/os/battery.nix
    ];

  networking = {
    hostName = "clementine";
    networkmanager.enable = true;
  };

  system.stateVersion = "25.11"; 

}
