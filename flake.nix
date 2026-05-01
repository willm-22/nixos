{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, niri, stylix, zen-browser, silentSDDM, sops-nix, disko, ... }@inputs:
  let
    denoFixOverlay = final: prev: {
      deno = prev.deno.overrideAttrs (_: {
        doCheck = false;
      });
    };

    desktopSystem = hostname: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.home-manager
        niri.nixosModules.niri
        stylix.nixosModules.stylix
        silentSDDM.nixosModules.default
        sops-nix.nixosModules.sops
        ./hosts/${hostname}/configuration.nix
        ./modules/nixos/common.nix
        ./modules/nixos/desktop.nix
        { nixpkgs.overlays = [ niri.overlays.niri denoFixOverlay ]; }
        { 
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.will.imports = [
              ./hosts/${hostname}/home.nix
              inputs.zen-browser.homeModules.twilight
            ];
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      "clementine" = desktopSystem "clementine";
      "angeles" = desktopSystem "angeles";

      "alameda" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
          disko.nixosModules.disko
          ./hosts/alameda/configuration.nix
          ./modules/nixos/common.nix
          ./modules/nixos/server.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.will.imports = [
                ./hosts/alameda/home.nix
              ];
            };
          }
        ];
      };
    };
  };
}
