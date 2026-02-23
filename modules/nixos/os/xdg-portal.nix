{ config, pkgs, lib, ... }:
{
  xdg.portal = lib.mkForce {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    config = {
      common.default = "*";
      niri = {
        default = [ "wlr" ];
	"org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
      };
    };
  };
}
