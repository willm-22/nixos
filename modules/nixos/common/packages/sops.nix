{ pkgs, lib, config, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/will/.config/sops/age/keys.txt";

    secrets.lastfm-password = {
      owner = config.users.users.will.name;
      #owner = "getlastfmpassword";
    };
  };

/*
    systemd.services."getlastfmpassword" = {
      script = ''#!/usr/bin/env bash
      	echo "
	$(cat ${config.sops.secrets."lastfm-password".path})
	" > /var/lib/getlastfmpassword/lastfmpassword
      '';
      serviceConfig = {
        User = "getlastfmpassword";
	WorkingDirectory = "/var/lib/getlastfmpassword";
      };
    };

    users.users.getlastfmpassword = {
      home = "/var/lib/getlastfmpassword";
      createHome = true;
      isSystemUser = true;
      group = "getlastfmpassword";
    };

    users.groups.getlastfmpassword = { };
*/

}
