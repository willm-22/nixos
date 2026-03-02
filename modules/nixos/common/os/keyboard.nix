{ config, ... }:
{
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.keyboard.qmk.enable = true;
}

