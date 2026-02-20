{ pkgs, config, lib, ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      credential.helper = "cache";
      credential."https://github.com".helper = "!gh auth git-credential";
      credential."https://gist.github.com".helper = "!gh auth git-credential";
    };
  };
}
