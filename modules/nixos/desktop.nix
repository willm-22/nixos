{ ... }:
{
  imports = [
    ./desktop/os/audio.nix
    ./desktop/os/bluetooth.nix
    ./desktop/os/keyring.nix
    ./desktop/os/printing.nix
    ./desktop/os/sddm.nix
    ./desktop/os/xdg-portal.nix

    ./desktop/packages/niri.nix
    ./desktop/packages/games.nix
    ./desktop/packages/thunar.nix

    ./desktop/stylix/stylix.nix
  ];
}
