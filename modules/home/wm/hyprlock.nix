{ config, lib, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = {
        fade_on_empty = false;
      };
    };
  };
}
