{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake ~/nixos#$(hostname)";
      gc = "nix-collect-garbage --delete-older-than 30d";
    };

    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
