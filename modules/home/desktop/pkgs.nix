{ pkgs, ... }:
{
  programs = {
    foliate.enable = true;
    onlyoffice.enable = true;
    zathura.enable = true;
  };

  home.packages = with pkgs; [
    nicotine-plus
    vlc
    feishin
    obs-studio
    better-control
    bitwarden-desktop
    bitwarden-cli
    wl-clipboard
    pavucontrol
    brightnessctl
    kdePackages.okular
    qmk
  ];
}
