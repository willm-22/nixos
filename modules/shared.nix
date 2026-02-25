{ pkgs, ... }:

{
  imports =
    [
      ./nixos/packages/shared-packages.nix
      ./nixos/os/locale.nix
      ./nixos/os/keyboard.nix
      ./nixos/os/printing.nix
      ./nixos/os/audio.nix
      ./nixos/os/ssh.nix
      ./nixos/os/keyring.nix
      ./nixos/services/tailscale.nix
      ./nixos/packages/sops.nix
    ];
  users.users.will = {
    isNormalUser = true;
    description = "will";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
