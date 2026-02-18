{ config, pkgs, lib, ... }:
{
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  environment.systemPackages = [ pkgs.tailscale ];
}
