{ pkgs, ... }:

# Created By @icanwalkonwater
# Edited and ported to Nix by @Th0rgal

let
  ac = "#1E88E5";
  mf = "#383838";  

  bg = "${xrdb:background}";
  fg = "#FFFFFF";

  # Colored
  # primary = "#ffb973";
  primary = "#b6ffff";

  # Dark
  # secondary = "#140e0a";
  secondary = "#000000";

  # Colored (light)
  tertiary = "#ffffff";

  # white
  quaternary = "#ecf0f1";

  # middle gray
  quinternary = "#384245";

  # Red
  urgency = "#e74c3c";
in
  {
    services.polybar = { 
      enable = true;
    
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
      };

      script = "polybar -q -r top & polybar -q -r bottom & polybar -q -r top-dp & polybar -q -r bottom-dp &";
    
      config = {
        "global/wm" = {
          margin-bottom = 0;
          margin-top = 0;
        };

  #====================BARS====================#

        "bar/top-dp" = {
          "inherit" = "bar/top";
          monitor = "DP-2";
        };

        "bar/bottom-dp" = {
          "inherit" = "bar/bottom";
          monitor = "DP-2";
        };

        "bar/top" = {
          bottom = false;
          fixed-center = true;

          width = "100%";
          height = 19;
          offset-x = "1%";

          scroll-up = "i3wm-wsnext";
          scroll-down = "i3wm-wsprev";

          background = bg;
          foreground = fg;

          radius = 0;

          font-0 = "FuraCode Nerd Font:size=12;3";
          font-1 = "FuraCode Nerd Font:style=Bold:size=12;3";

          modules-left = "distro-icon dulP ddrT i3 dulT";
          modules-center = "title";
          modules-right = "durT audio ddlT durP wireless-network ddlP date";

          locale = "en_US.UTF-8";
        };

        "bar/bottom" = {
          bottom = true;
          fixed-center = true;
          
          width = "100%";
          height = 19;
          
          offset-x = "1%";
          
          background = bg;
          foreground = fg;
          
          radius-top = 0;        

          tray-position = "left";
          tray-detached = false;
          tray-maxsize = 15;
          tray-background = primary;
          tray-offset-x = -19;
          tray-offset-y = 0;
          tray-padding = 5;
          tray-scale = 1;
          padding = 0;

          font-0 = "FuraCode Nerd Font:size=12;3";
          font-1 = "FuraCode Nerd Font:style=Bold:size=12;3";
          
          modules-left = "powermenu ddlS durT temperature ddlT";

          modules-right = "ddrS cpu dulS ddrT memory dulT ddrP battery";
          
          locale = "en_US.UTF-8";
        };

        "settings" = {
          throttle-output = 5;
          throttle-output-for = 10;
          throttle-input-for = 30;
          
          screenchange-reload = true;

          compositing-background = "source";
          compositing-foreground = "over";
          compositing-overline = "over";
          comppositing-underline = "over";
          compositing-border = "over";
          
          pseudo-transparency = "false";
        };

  #--------------------MODULES--------------------"

        "module/distro-icon" = {
          type = "custom/script";
          exec = "/run/current-system/sw/bin/nixos-version | /run/current-system/sw/bin/grep -o '[0-9]\\+\\.[0-9]\\+' | /run/current-system/sw/bin/head -1";
          interval = 999999999;

          format = " <label>";
          format-background = primary;
          format-foreground = secondary;
          format-padding = 1;
          label = "%output%";
          label-font = 2;
        };

        "module/audio" = {
          type = "internal/alsa";
          
          format-volume = "墳 VOL <label-volume>";
          format-volume-padding = 1;
          format-volume-foreground = secondary;
          format-volume-background = tertiary;
          label-volume = "%percentage%%";

          format-muted = "<label-muted>";
          format-muted-padding = 1;
          format-muted-foreground = secondary;
          format-muted-background = tertiary;
          format-muted-prefix = "婢 ";
          format-muted-prefix-foreground = urgency;
          format-muted-overline = bg;
          
          label-muted = "VOL Muted";
        };
        
        "module/battery" = {
          type = "internal/battery";
          full-at = 101; # to disable it
          battery = "BAT0"; # TODO: Better way to fill this

          poll-interval = 2;
          
          label-full = " 100%";
          format-full-padding = 1;
          format-full-foreground = secondary;
          format-full-background = primary;

          format-charging = " <animation-charging> <label-charging>";
          format-charging-padding = 1;
          format-charging-foreground = secondary;
          format-charging-background = primary;
          label-charging = "%percentage%% +%consumption%W";
          animation-charging-0 = "";
          animation-charging-1 = "";
          animation-charging-2 = "";
          animation-charging-3 = "";
          animation-charging-4 = "";
          animation-charging-framerate = 500;

          format-discharging = "<ramp-capacity> <label-discharging>";
          format-discharging-padding = 1;
          format-discharging-foreground = secondary;
          format-discharging-background = primary;
          label-discharging = "%percentage%% -%consumption%W";
          ramp-capacity-0 = "";
          ramp-capacity-0-foreground = urgency;
          ramp-capacity-1 = "";
          ramp-capacity-1-foreground = urgency;
          ramp-capacity-2 = "";
          ramp-capacity-3 = "";
          ramp-capacity-4 = "";
        };
        
        "module/cpu" = {
          type = "internal/cpu";
          
          interval = "0.5";

          format = " <label>";
          format-foreground = quaternary;
          format-background = secondary;
          format-padding = 1;

          label = "CPU %percentage%%";
        };
        
        "module/date" = {
          type = "internal/date";
          
          interval = "1.0";
          
          time = "%H:%M:%S";
          time-alt = "%Y-%m-%d%";
          
          format = "<label>";
          format-padding = 2;
          format-foreground = fg;
          
          label = "%time%";
        };

        "module/i3" = {
          type = "internal/i3";
          pin-workspaces = false;
          strip-wsnumbers = true;        
          format = "<label-state> <label-mode>";
          format-background = tertiary;

          ws-icon-0 = "1";
          ws-icon-1 = "2";
          ws-icon-2 = "3";
          ws-icon-3 = "4";
          ws-icon-4 = "5";
          ws-icon-5 = "6";
          ws-icon-6 = "7";
          ws-icon-7 = "8";
          ws-icon-8 = "9";
          ws-icon-9 = "10";

          label-mode = "%mode%";
          label-mode-padding = 1;

          label-unfocused = "%index%";
          label-unfocused-foreground = quinternary;
          label-unfocused-padding = 1;

          label-focused = "%index%";
          label-focused-font = 2;
          label-focused-foreground = secondary;
          label-focused-padding = 1;

          label-visible = "%icon%";
          label-visible-padding = 1;
          
          label-urgent = "%index%";
          label-urgent-foreground = urgency;
          label-urgent-padding = 1;

          label-separator = "";
        };

        "module/title" = {
          type = "internal/xwindow";
          format = "<label>";
          label = "%title%";
          label-maxlen = 70;
        };
        
        "module/memory" = {
          type = "internal/memory";
          
          interval = 3;

          format = " <label>";
          format-background = tertiary;
          format-foreground = secondary;
          format-padding = 1;
          
          label = "RAM %percentage_used%%";
        };
        
        "module/network" = {
          type = "internal/network";
          interface = "wlp1s0";
          
          interval = "1.0";
          
          accumulate-stats = true;
          unknown-as-up = true;
          
          format-connected = "<label-connected>";
          format-connected-background = mf;
          format-connected-underline = bg;
          format-connected-overline = bg;
          format-connected-padding = 2;
          format-connected-margin = 0;
          
          format-disconnected = "<label-disconnected>";
          format-disconnected-background = mf;
          format-disconnected-underline = bg;
          format-disconnected-overline = bg;
          format-disconnected-padding = 2;
          format-disconnected-margin = 0;
          
          label-connected = "D %downspeed:2% | U %upspeed:2%";
          label-disconnected = "DISCONNECTED";
        };
        
        "module/temperature" = {
          type = "internal/temperature";
          
          thermal-zone = 0; # TODO: Find a better way to fill that
          warn-temperature = 60;
          units = true;
          
          format = "<label>";
          interval = 3;
          
          format-background = tertiary;
          format-foreground = secondary;
          format-padding = 1;
          
          label = " TEMP %temperature-c%";
        };

        "module/powermenu" = {
          type = "custom/menu";
          expand-right = true;

          format = "<label-toggle> <menu>";
          format-background = secondary;
          format-padding = 1;

          label-open = "";
          label-close = "  ";
          label-separator = "  ";

          menu-0-0 = " Lock";
          menu-0-0-exec = "dm-tool lock";
          menu-0-1 = " Reboot";
          menu-0-1-exec = "reboot";
          menu-0-2 = " Shutdown";
          menu-0-2-exec = "systemctl poweroff";
        };

        "module/wireless-network" = {
          type = "internal/network";
          interface = "wlp1s0";

          label-connected = " 直 %essid% %downspeed% ";
          label-connected-background = primary;
          label-connected-foreground = secondary;
          label-disconnected = " 睊 NOT CONNECTED ";
          label-disconnected-background = primary;
          label-disconnected-foreground = secondary;

          format-connected = "<label-connected>";
          format-disconnected = "<label-disconnected>";
        };

  #--------------------SOLID TRANSITIONS--------------------#

        "module/dsPT" = {
          type = "custom/text";
          content = "";
          content-background = primary;
          content-foreground = tertiary;
        };

        "module/dsTS" = {
          type = "custom/text";
          content = "";
          content-background = tertiary;
          content-foreground = secondary;
        };

        "module/dsST" = {
          type = "custom/text";
          content = "";
          content-background = secondary;
          content-foreground = tertiary;
        };

        "module/daPT" = {
          type = "custom/text";
          content = "";
          content-background = primary;
          content-foreground = tertiary;
        };

        "module/daTP" = {
          type = "custom/text";
          content = "";
          content-background = tertiary;
          content-foreground = primary;
        };

        "module/daST" = {
          type = "custom/text";
          content = "";
          content-background = secondary;
          content-foreground = tertiary;
        };

        "module/daTS" = {
          type = "custom/text";
          content = "";
          content-background = secondary;
          content-foreground = primary;
        };

        "module/daSP" = {
          type = "custom/text";
          content = "";
          content-background = secondary;
          content-foreground = primary;
        };      

  #--------------------GAPS TRANSITIONS--------------------#

        "module/dulT" = {
          type = "custom/text";
          content = "";
          content-foreground = tertiary;
          content-background = bg;
        };

        "module/ddrT" = {
          type = "custom/text";
          content = "";
          content-foreground = tertiary;
          content-background = bg;
        };

        "module/ddlT" = {
          type = "custom/text";
          content = "";
          content-foreground = tertiary;
          content-background = bg;
        };

        "module/durT" = {
          type = "custom/text";
          content = "";
          content-foreground = tertiary;
          content-background = bg;
        };

        "module/ddlP" = {
          type = "custom/text";
          content = "";
          content-foreground = primary;
          content-background = bg;
        };

        "module/durP" = {
          type = "custom/text";
          content = "";
          content-foreground = primary;
          content-background = bg;
        };

        "module/dulP" = {
          type = "custom/text";
          content = "";
          content-foreground = primary;
          content-background = bg;
        };

        "module/ddrP" = {
          type = "custom/text";
          content = "";
          content-foreground = primary;
          content-background = bg;
        };

        "module/dulS" = {
          type = "custom/text";
          content = "";
          content-foreground = secondary;
          content-background = bg;
        };

        "module/ddlS" = {
          type = "custom/text";
          content = "";
          content-foreground = secondary;
          content-background = bg;
        };

        "module/durS" = {
          type = "custom/text";
          content = "";
          content-foreground = secondary;
          content-background = bg;
        };

        "module/ddrS" = {
          type = "custom/text";
          content = "";
          content-foreground = secondary;
          content-background = bg;
        };
      };
    };
  }
