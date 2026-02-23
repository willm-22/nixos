{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./packages/niri.nix
      ./packages/thunar.nix
      ./packages/sops.nix
      ./stylix/stylix.nix
      ./os/firewall.nix
      ./os/xdg-portal.nix
      ./os/bluetooth.nix
      ./os/environment-variables.nix
      ./os/sddm.nix
      ./os/audio.nix
      ./os/keyboard.nix
      ./os/printing.nix
      ./os/ssh.nix
      ./os/locale.nix
  ];
}
