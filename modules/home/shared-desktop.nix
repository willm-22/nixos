{ config, pkgs, lib, ... }:
{
  imports = [
    ./wm/wm.nix
    ./yazi.nix
    ./pkgs.nix
    ./git.nix
    ./environment-variables.nix
    ./browser/zen.nix
    ./rofi/rofi.nix
    ./terminal/terminal.nix
    ./theme/theme.nix
    ./services/syncthing.nix
    ./neovim/neovim.nix
    ./study/study.nix
  ];
}
