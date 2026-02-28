{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos/common.nix
      ../../modules/nixos/desktop.nix

      ../../modules/nixos/desktop/nfs/music.nix
    ];

  networking = {
    hostName = "angeles";
    networkmanager.enable = true;
  };

  system.stateVersion = "25.11"; 

}
