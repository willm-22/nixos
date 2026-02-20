{ config, pkgs, lib, ... }:
  let
    rofi-mpd = pkgs.writeShellApplication {
      name = "rofi-mpd";
      runtimeInputs = with pkgs; [ mpc rofi ];
      text = ''
	options="Play/Pause\nNext\nPrevious\nStop\nClear Playlist\nShuffle"
	
	# Get the current song to show as a prompt
	current=$(mpc current -f "[%artist% - ]%title%" || echo "MPD Offline")

	chosen=$(echo -e "$options" | rofi -dmenu -p "󰎆 $current" -i)

	case "$chosen" in
            "Play/Pause")     mpc toggle ;;
            "Next")           mpc next ;;
            "Previous")       mpc prev ;;
            "Stop")           mpc stop ;;
            "Clear Playlist") mpc clear ;;
            "Shuffle")        mpc shuffle ;;
	    "Search Album")
	        query=$(rofi -dmenu -p "Search Album:" -i)

		if [ -n "$query" ]; then
		  album_list=$(mpd list album | grep -i "$query")

		  if [ -n "$album_list" ]; then
		  selected_album=$(echo -e "$album_list" | rofi -dmenu -p "Select Album:" -i)

		    if [ -n "$selected_album" ]; then
		        mpc clear
		        mpc findadd album "$selected_album"
		        mpc play
		    fi
		  fi
		fi
	        ;;
        esac
      '';
    };
  in {
    home.packages = [ rofi-mpd ];
  }
