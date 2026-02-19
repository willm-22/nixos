{ pkgs, lib, config, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/will/.config/sops/age/keys.txt";

    secrets = {
      lastfm-password = {};
    };
  };



}
