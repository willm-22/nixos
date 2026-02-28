{ ... }:
{
  imports = [
    ./common/os/boot.nix
    ./common/os/environment-variables.nix
    ./common/os/firewall.nix
    ./common/os/keyboard.nix
    ./common/os/locale.nix
    ./common/os/ssh.nix
    ./common/os/user.nix

    ./common/packages/shared-packages.nix
    ./common/packages/sops.nix

    ./common/services/tailscale.nix
  ];
}
