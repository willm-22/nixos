{ config, lib, pkgs, ... }:
{
  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/mnt/hdd1/music"
    };
  };
}
