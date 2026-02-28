{ config, pkgs, lib, ... }:
{
  users.users.will = {
    isNormalUser = true;
    description = "will";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };
}
