{ pkgs, config, lib, ... }:
{
  programs.steam.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

}
