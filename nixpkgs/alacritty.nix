{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        title = "Terminal";
        dimensions = {
          lines = 75;
          columns = 100;
        };
      };

      font = {
        normal.family = "Jetbrains Mono";
        size = 6;
      };

      background_opacity = 0.95;

      colors = {
        primary = {
          background = "0x262626";
          foreground = "0xfefefe";
        };
        normal = {
          black   = "0x000000";
          red     = "0xcc241d";
          green   = "0x98971a";
          yellow  = "0xd79921";
          blue    = "0x458588";
          magenta = "0xb16286";
          cyan    = "0x689d6a";
          white   = "0xffffff";
        };
        bright = {
          black   = "0x676767";
          red     = "0xfb4931";
          green   = "0xb8bb26";
          yellow  = "0xfabd2f";
          blue    = "0x83a598";
          magenta = "0xd3869b";
          cyan    = "0x8ec07c";
          white   = "0xfeffff";
        };
      };
    };
  };
}
