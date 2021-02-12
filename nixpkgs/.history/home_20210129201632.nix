{ pkgs, ... }:

{
  imports = [
    ./vscode.nix
    ./i3.nix
    ./alacritty.nix
    ./vim.nix
    ./rofi.nix
    ./polybar.nix
    ./compton.nix
  ];

  home.packages = with pkgs; [
    feh neofetch google-chrome
    (polybar.override { i3GapsSupport = true; })
    brightnessctl
    jetbrains-mono roboto
  ];

  nixpkgs.config.allowUnfree = true;
  xsession.enable = true;

  # set -U fish_color_autosuggestion      brblack
  # set -U fish_color_cancel              -r
  # set -U fish_color_command             brgreen
  # set -U fish_color_comment             brmagenta
  # set -U fish_color_cwd                 green
  # set -U fish_color_cwd_root            red
  # set -U fish_color_end                 brmagenta
  # set -U fish_color_error               brred
  # set -U fish_color_escape              brcyan
  # set -U fish_color_history_current     --bold
  # set -U fish_color_host                normal
  # set -U fish_color_match               --background=brblue
  # set -U fish_color_normal              normal
  # set -U fish_color_operator            cyan
  # set -U fish_color_param               brblue
  # set -U fish_color_quote               yellow
  # set -U fish_color_redirection         bryellow
  # set -U fish_color_search_match        'bryellow' '--background=brblack'
  # set -U fish_color_selection           'white' '--bold' '--background=brblack'
  # set -U fish_color_status              red
  # set -U fish_color_user                brgreen
  # set -U fish_color_valid_path          --underline
  # set -U fish_pager_color_completion    normal
  # set -U fish_pager_color_description   yellow
  # set -U fish_pager_color_prefix        'white' '--bold' '--underline'
  # set -U fish_pager_color_progress      'brwhite' '--background=cyan'
  programs.fish = {
    enable = true;
  };

  services.redshift = {
    latitude = "46.51723660398567";
    longitude = "6.632170519072659";
    enable = true;
    brightness = {
      # Note the string values below.
      day = "1";
      night = "1";
    };
    temperature = {
      day = 5500;
      night = 3700;
    };
  };
}
