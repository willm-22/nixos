{ pkgs, config, lib, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "everforest";
  };
}
