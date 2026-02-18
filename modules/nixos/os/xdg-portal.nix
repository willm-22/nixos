{ config, pkgs, lib, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common.default = "*";
      niri = {
        default = [ "gtk" ];
	"org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };
}
