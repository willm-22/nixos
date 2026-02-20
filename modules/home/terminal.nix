{ lib, config, pkgs, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      background_opacity = "0.8";
      window_padding_width = 8;
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
  };
}
