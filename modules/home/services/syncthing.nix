{ pkgs, lib, config, ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };
}
