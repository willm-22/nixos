{ config, pkgs, lib, ... }:
{
  services.mpdscribble = {
    enable = true;
    endpoints = {
      "last.fm" = {
        username = "Willm_";
	passwordFile = config.sops.secrets."lastfm-password".path;
      };
    };
  };
}
