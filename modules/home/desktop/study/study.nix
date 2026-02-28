{ config, pkgs, lib, ... }:
{
  imports = [
    ./anki.nix
    ./obsidian.nix
  ];
}
