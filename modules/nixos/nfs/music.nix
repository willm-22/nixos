{ config, lib, pkgs, ... }:
{
  boot.supportedFilesystems = [ "nfs" ];

  fileSystems."/mnt/hdd1" = {
    device = "debian:/mnt/hdd1";
    fsType = "nfs";

    options = [ "_netdev" "soft" "intr" "x-systemd.mount-timeout=5s" ];
  };

#  systemd.mounts = [{
#    where = "/mnt/hdd1";
#    after = [ "tailscaled.service" ];
#    requires = [ "tailscaled.service" ];
#    options = "_netdev,soft,intr,x-systemd.mount-timeout=5s";
#  }];

  systemd.services.tailscaled.before = [ "remote-fs.target" ];
}
