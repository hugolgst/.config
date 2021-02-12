{ pkgs, ... }:

{
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