{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    btop
    sops
    dos2unix
  ];

  programs.fish.enable = true;

  programs.firefox.enable = true;
}
