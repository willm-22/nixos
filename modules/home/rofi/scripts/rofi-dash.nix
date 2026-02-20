{ pkgs, config, lib, ... }:
let
  rofi-dash = pkgs.writeShellApplication {
    name = "rofi-dash";
    runtimeInputs = with pkgs; [ rofi procps lm_sensors coreutils systemd niri mpc jq ];
    text = ''
      # 1. System Stats
      TIME=$(date "+%A, %B %d | %H:%M:%S")
      UPTIME=$(uptime -p | sed 's/up //')
      MEM=$(free -m | awk '/Mem:/ { printf "%d/%d MB", $3, $2 }')
      TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' || echo "N/A")

      # 2. Niri Workspaces
      # Filters for active workspaces and joins them with icons
      WORKSPACES=$(niri msg -j workspaces | jq -r '[.[] | select(.output != null)] | sort_by(.id) | to_entries | .[] | "\(.key + 1)" as $idx | if .value.is_focused then "[\($idx)]" else $idx end' | tr '\n' ' ' | sed 's/ $//')

      # 3. MPD Status (We store this in a variable to match in the case statement later)
      MPD_NOW=$(mpc current -f "%artist% - %title%" || echo "Stopped")
      MPD_LINE="󰎆 $MPD_NOW"

      # 4. Battery Logic
      BATT_INFO=""
      if [ -d /sys/class/power_supply/BAT0 ]; then
          CAP=$(cat /sys/class/power_supply/BAT0/capacity)
          STAT=$(cat /sys/class/power_supply/BAT0/status)
          BATT_INFO="󰁹 Battery: $CAP% ($STAT)\n"
      fi

      # 5. Build the Menu
      WS_DISPLAY="''${WORKSPACES:-[1]}"
      info_rows="󱑂 $TIME\n󰅐 Uptime: $UPTIME\n󰍛 RAM: $MEM\n󰏈 Temp: $TEMP\n󰖲 Workspaces: [ $WS_DISPLAY ]\n$MPD_LINE\n$BATT_INFO"
      sep="──────────────────────────────"
      actions="󰐥 Shutdown\n󰜉 Reboot\n󰤄 Suspend"

      # 6. Execute Rofi
      chosen=$(echo -e "$info_rows$sep\n$actions" | rofi -dmenu \
        -p "Dashboard" \
        -i \
        -selected-row 5 \
        -theme-str 'listview { lines: 11; } window { width: 40em; }')

      # 7. Handle Actions + Interactions
      case "$chosen" in
          "$MPD_LINE")  mpc toggle ;;
          "󰐥 Shutdown") systemctl poweroff ;;
          "󰜉 Reboot")   systemctl reboot ;;
          "󰤄 Suspend")  systemctl suspend ;;
      esac
    '';
  };
in {
  home.packages = [ rofi-dash ];
}
