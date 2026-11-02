{ config, lib, pkgs, packages, ... }:

let
  cfg = config.modules.lxqt;
in
{
  options.modules.lxqt = {
    enable = lib.mkEnableOption "Enable lxqt";
  };

  config = lib.mkIf cfg.enable {
    xdg.portal.enable = true;
    xdg.portal.lxqt.enable = true;

    services.xserver.enable = true;
    services.xserver.desktopManager.lxqt.enable = true;
    
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = false; 
    services.displayManager.defaultSession = "lxqt";

    # lxqt xscreensaver fix
    services.xscreensaver.enable = true;
    security.pam.services.xscreensaver.enable = true;

    qt.platformTheme = "lxqt";

    # add missing lxqt packages
    environment.systemPackages = [
      pkgs.lxqt.qlipper
      packages.nm-tray
      pkgs.unzip # for archiver, maybe should be placed somewhere else?
      pkgs.p7zip
    ];
  };
}