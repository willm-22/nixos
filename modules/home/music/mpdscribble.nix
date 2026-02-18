{ config, pkgs, lib, ... }:
{
  services.mpdscribble = {
    enable = true;
    endpoints = {
      "last.fm" = {
        username = "willm_";
	passwordFile =
      };
    };
  };
}
