{ pkgs, ... }:
{
  #programs.calibre.enable = true;
  programs.foliate.enable = true;
  programs.onlyoffice.enable = true;
  programs.gh.enable = true;
  programs.btop.enable = true;
  programs.fastfetch.enable = true;
  programs.zathura.enable = true;

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
    python3
    unzip
    pavucontrol
    python3Packages.dbus-python
    brightnessctl
    kdePackages.okular
    fd
  ];
}
