{ config, lib, pkgs, ... }:

let
  cfg = config.modules.ime;
in
{
  options.modules.ime = {
    enable = lib.mkEnableOption "Enable IME interfaces";
  };

  config = lib.mkIf cfg.enable {
    i18n.inputMethod.enable = true;
    i18n.inputMethod.type = "fcitx5";
    i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  };
}