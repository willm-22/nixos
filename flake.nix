{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
	home-manager.follows = "home-manager";
      };
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, niri, stylix, zen-browser, silentSDDM, disko, ... }@inputs:
  {
    nixosConfigurations."clementine" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.home-manager
	niri.nixosModules.niri
	stylix.nixosModules.stylix
	silentSDDM.nixosModules.default
	#disko.nixosModules.disko
        ./hosts/clementine/configuration.nix
        #./hosts/clementine/disko.nix
	./modules/shared.nix
	{
	  nixpkgs.overlays = [ niri.overlays.niri ];
	}
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    extraSpecialArgs = { inherit inputs; };
	    users.will = {
	      imports = [
	        ./hosts/clementine/home.nix
		inputs.zen-browser.homeModules.twilight
	      ];
	    };
	  };
	}
      ];
    };
  };
}
