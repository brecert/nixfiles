{ config, lib, packages, ... }:

let
  cfg = config.home-modules.fuchsia-cursor;
in
{
  options.home-modules.fuchsia-cursor = {
    enable = lib.mkEnableOption "Enable fuchsia themed cursor";
  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      package = packages.fuchsia-cursor;
      name = "Fuchsia";
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}