{ config, lib, ... }:
{
  networking.firewall.allowedTCPPorts = [ 2049 8384 ];
}
