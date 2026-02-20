{ pkgs, config, lib, ... }:
{
  programs.rofi = lib.mkForce {
    enable = true;
    font = "JetBrainsMono Nerd Font 13";
  };
}
