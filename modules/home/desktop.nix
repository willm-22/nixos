{ ... }:
{
  imports = [
    ./desktop/pkgs.nix

    ./desktop/browser/zen.nix

    ./desktop/rofi/rofi.nix
    
    ./desktop/services/syncthing.nix

    ./desktop/study/study.nix

    ./desktop/theme/theme.nix

    ./desktop/wm/wm.nix

    ./desktop/games/games.nix
    
    ./desktop/terminal/kitty.nix
  ];
}
