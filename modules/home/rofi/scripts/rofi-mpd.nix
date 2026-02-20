{ pkgs, config, lib, ... }:
let
  rofi-mpd = pkgs.writeShellApplication {
    name = "rofi-mpd";
    runtimeInputs = with pkgs; [ mpc rofi gawk ];
    text = ''
      # Main menu
      main_options="Play/Pause\nNext\nPrevious\nSearch Artist\nSearch Album\nSearch Song\nShuffle\nClear"
      
      current=$(mpc current -f "[%artist% - ]%title%" || echo "MPD Offline")
      chosen=$(echo -e "$main_options" | rofi -dmenu -p "󰎆 $current" -i)

      case "$chosen" in
          "Play/Pause") mpc toggle ;;
          "Next")       mpc next ;;
          "Previous")   mpc prev ;;
          "Shuffle")    mpc shuffle ;;
          "Clear")      mpc clear ;;
          
          "Search Artist")
              query=$(rofi -dmenu -p "Search Artist:" -i)
              if [ -n "$query" ]; then
                  artist=$(mpc list artist | grep -i "$query" | rofi -dmenu -p "Select Artist:" -i)
                  if [ -n "$artist" ]; then
                      mpc clear && mpc findadd artist "$artist" && mpc play
                  fi
              fi
              ;;

          "Search Album")
              query=$(rofi -dmenu -p "Search Album:" -i)
              if [ -n "$query" ]; then
                  album=$(mpc list album | grep -i "$query" | rofi -dmenu -p "Select Album:" -i)
                  if [ -n "$album" ]; then
                      mpc clear && mpc findadd album "$album" && mpc play
                  fi
              fi
              ;;
	  "Search Song")
              query=$(rofi -dmenu -p "Search Song:" -i)
              if [ -n "$query" ]; then
                  song_list=$(mpc search title "$query" -f "%artist% - %title% (%file%)")
                  if [ -n "$song_list" ]; then
                      selection=$(echo -e "$song_list" | rofi -dmenu -p "Select Song:" -i)
                      if [ -n "$selection" ]; then
                          # ShellCheck friendly: Extract content inside the last parentheses
                          file="''${selection%)}"   # Remove trailing )
                          file="''${file##*(}"    # Remove everything before the last (
                          
                          mpc add "$file" && mpc play "$(mpc playlist | wc -l)"
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
