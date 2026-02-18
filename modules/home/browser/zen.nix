{ pkgs, lib, config, ... }:
{
  programs.zen-browser = {
    enable = true;

    profiles = {
      will = {
      };
    };
  };

  #stylix.targets.zen-browser.profileNames = [ "will" ]; 
  stylix.targets.zen-browser.enable = false;
}
