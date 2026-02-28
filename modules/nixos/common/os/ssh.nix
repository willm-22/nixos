{ config, pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.will = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEHyKVT1z18TyxS+3G6d8eTsISovPSyJeoyMsOg1BLp willm2203@proton.me"
    ];
  };
}
