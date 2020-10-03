{ pkgs, ... }:

{ 
  services.compton = {
    enable = true;
    package = pkgs.callPackage ./compton-unstable.nix { };
    
    activeOpacity = "1.0";
    menuOpacity = "0.9";

    extraOptions = ''
      shadow-radius = 7;
      clear-shadow = true;
      frame-opacity = 0.7;
      blur-method = "dual_kawase";
      blur-strength = 5;
      alpha-step = 0.06;
      detect-client-opacity = true;
      detect-rounded-corners = true;
      paint-on-overlay = true;
      detect-transient = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
    '';
  };
}