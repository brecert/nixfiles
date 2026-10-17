{ config, lib, pkgs, ... }:

let
  cfg = config.modules.vr;
in
{
  options.modules.vr = {
    enable = lib.mkEnableOption "Enable VR Support";
  };

  config = lib.mkIf cfg.enable {
    services.monado = {
      enable = true;
      highPriority = true;
      defaultRuntime = true;
    };

    services.wivrn = {
      enable = true;
      openFirewall = true;
      
      steam.enable = lib.mkIf config.programs.steam.enable true;
      steam.importOXRRuntimes = true;

      config.enable = true;
      config.json = {
        application = [ pkgs.wayvr ];
      };
    };
  };
}