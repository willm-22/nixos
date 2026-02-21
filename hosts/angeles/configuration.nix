{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos/nfs/music.nix
      ../../modules/nixos/shared-desktop.nix
    ];

  networking = {
    hostName = "angeles";
    networkmanager.enable = true;
  };

  system.stateVersion = "25.11"; 

}
