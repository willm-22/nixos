{ config, pkgs, lib, ... }:
{
  programs.niri.settings.outputs = {
    "DP-1" = {
      mode = {
        height = 1080;
	width = 1920;
	refresh = 120.000;
      };
      scale = 1;
      position.x = 1920;
      position.y = 0;
    };

    "HDMI-A-1" = {
      mode = {
        height = 1080;
	width = 1920;
	refresh = 144.001;
      };
      scale = 1;
      position.x = 0;
      position.y = 0;
    };
  };
}
