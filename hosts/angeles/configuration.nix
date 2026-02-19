{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos/packages/niri.nix
      ../../modules/nixos/packages/swaylock.nix
      ../../modules/nixos/stylix/stylix.nix
      ../../modules/nixos/packages/thunar.nix
      ../../modules/nixos/nfs/music.nix
      ../../modules/nixos/os/firewall.nix
      ../../modules/nixos/os/sddm.nix
      ../../modules/nixos/os/xdg-portal.nix
      ../../modules/nixos/os/bluetooth.nix
    ];

  networking = {
    hostName = "angeles";
    networkmanager.enable = true;
  };

  system.stateVersion = "25.11"; 

}
