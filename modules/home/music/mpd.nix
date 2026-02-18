{ config, pkgs, lib, ... }:
{
  services.mpd = {
    enable = true;
    dbFile = "/home/will/nixos/modules/home/music/mpd/mpd.db";
    dataDir = /home/will/nixos/modules/home/music/mpd/data;
    musicDirectory = /mnt/hdd1/music;
    playlistDirectory = /home/will/nixos/modules/home/music/mpd/playlists;
    network = {
      port = 6600;
      listenAddress = "any";
    };

    extraConfig = ''
      audio_output {
        type	"pulse"
	name	"PulseAudio"
      }

      audio_buffer_size "4096"
    '';
  };
}
