{ pkgs, config, lib, ... }:
{
  programs.obsidian = {
    enable = true;
  };
  stylix.targets.obsidian.enable = false;
}
