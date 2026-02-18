{ config, lib, pkgs, ... }:
{
  stylix.enable = true;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  stylix.image = ./Wallpapers/forest1.jpg;
  stylix.polarity = "dark";
  
  stylix.icons = {
    enable = true;
    package = pkgs.papirus-icon-theme;
    light = "Papirus-Light";
    dark = "Papirus-Dark";
  };
}
