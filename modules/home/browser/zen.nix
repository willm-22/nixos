{ pkgs, lib, config, ... }:
{
  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;
    profiles = {
      will = {
      };
    };
  };

  stylix.targets.zen-browser.profileNames = [ "will" ]; 
  stylix.targets.zen-browser.enable = true;
}
