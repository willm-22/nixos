{ pkgs, config, lib, ... }:
{
  programs.rofi = lib.mkForce {
    enable = true;
    font = "JetBrainsMono Nerd Font 13";
    extraConfig = {
      modi = "drun,bitwarden:${./scripts/bwmenu}";
      location = 6;
      yoffset = 20;
      xoffset = 0;
    };
  };
}
