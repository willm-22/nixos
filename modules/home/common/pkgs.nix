{ pkgs, ... }:
{
  programs.btop.enable = true;
  programs.fastfetch.enable = true;

  home.packages = with pkgs; [
    jq
    gnupg
    fzf
    python3
    unzip
    fd
  ];
}
