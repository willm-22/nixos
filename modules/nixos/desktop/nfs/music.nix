{ config, lib, pkgs, ... }:
{
  boot.supportedFilesystems = [ "nfs" ];

  fileSystems."/mnt/hdd1" = {
    device = "debian:/mnt/hdd1";
    fsType = "nfs";

    options = [ "_netdev" "soft" "intr" "x-systemd.mount-timeout=5s" "nofail" "timeo=5" "retrans=2" "x-systemd.requires=tailscaled.service" "x-systemd.after=tailscaled.service" ];
  };

  #systemd.services.tailscaled = {
    #before = [ "remote-fs.target" ];
    #after = [ "network-online.target" ];
    #wantedBy = [ "remote-fs.target" ];
  #};
  systemd.services.umount-hdd1 = {
    description = "Force unmount /mnt/hdd1 before network shutdown";
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.coreutils}/bin/true";
      ExecStop = "${pkgs.util-linux}/bin/umount -f -l /mnt/hdd1";
      TimeoutStopSec = "10s";
    };
    after = [ "mnt-hdd1.mount" ];
    before = [ "shutdown.target" "reboot.target" "halt.target" ];
    wantedBy = [ "multi-user.target" ];
  };
}
