{ pkgs, lib, ... }:

{
    xsession.windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        
        config = rec {
            modifier = "Mod1";
            bars = [];

            window.border = 0;
            gaps = {
                inner = 15;
                outer = 5;
            };

            keybindings = lib.mkOptionDefault {
                "XF86AudioMute" = "exec amixer set Master toggle";
                "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
                "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
                "XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
                "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";
                "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
                "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
                "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
                "${modifier}+Shift+x" = "exec dm-tool lock";
                "${modifier}+Shift+s" = "exec escrotum -s -C";
            };

            startup = [
                {
                    command = "systemctl --user restart polybar.service";
                    always = true;
                    notification = false;
                }

                {
                    command = "setxkbmap -layout us -variant intl";
                    always = true;
                    notification = false;
                }

                {
                    command = "xrandr --output DP-2 --mode 2880x1620";
                    always = true;
                    notification = false;
                }
                
                {
                    command = "feh --bg-scale ~/.background.jpg";
                    always = true;
                    notification = false;
                }
            ];
        };
    };
}
