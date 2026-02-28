{ pkgs, lib, config, ... }:
{
  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;
    profiles = {
      will = {
	    spacesForce = true;
	    spaces = {
	      "one" = {
		id = "cc28ccf1-b8af-4d69-8aef-04107e7038eb";
		position = 1000;
	      };
	      "two" = {
		id = "f31b8ea9-ecff-48f4-9b32-ff8f5ab9a4ab";
		position = 1001;
	      };
	      "three" = {
		id = "fb0b3e09-d4db-4cc6-b5ef-4fec45a9546c";
		position = 1002;
	      };
	    };

      };
    };
  };

  stylix.targets.zen-browser.profileNames = [ "will" ]; 
  stylix.targets.zen-browser.enable = true;
}
