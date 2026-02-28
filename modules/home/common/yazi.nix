{ config, pkgs, lib, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
  };
}
