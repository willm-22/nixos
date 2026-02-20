{ pkgs, ... }:
{
  programs.calibre.enable = true;
  programs.onlyoffice.enable = true;

  home.packages = with pkgs; [
    nicotine-plus
    vlc
    feishin
    obs-studio
    better-control
    bitwarden-desktop
    bitwarden-cli
    wl-clipboard
    jq
    gnupg
    fzf
  ];
}
