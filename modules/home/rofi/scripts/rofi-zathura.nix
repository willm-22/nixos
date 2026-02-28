{ pkgs, config, lib, ... }:
let
  rofi-zathura = pkgs.writeShellApplication {
    name = "rofi-zathura";
    runtimeInputs = with pkgs; [ fd rofi zathura ];
    text = ''
      # Search dirs: override with ZATHURA_SEARCH_DIRS env var (colon-separated)
      # e.g. ZATHURA_SEARCH_DIRS="$HOME/Documents:$HOME/Books"
      IFS=':' read -ra search_dirs <<< "''${ZATHURA_SEARCH_DIRS:-$HOME}"

      # Find documents and present them in rofi, ~ substituted for readability
      selected=$(
        fd . --type f \
          -e pdf -e epub -e cbz -e cbr -e djvu -e ps -e xps -e mobi \
          --no-hidden \
          "''${search_dirs[@]}" 2>/dev/null \
        | sed "s|^$HOME/|~/|" \
        | rofi -dmenu \
            -i \
            -p " Document" \
            -no-custom
      )

      [ -z "$selected" ] && exit 0

      # Re-expand ~/
      selected="''${selected/#\~/$HOME}"

      zathura "$selected" &
    '';
  };
in {
  home.packages = [ rofi-zathura ];
}
