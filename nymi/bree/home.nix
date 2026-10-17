{ config, pkgs, packages, ... }:
{
  imports = [
    ./config.nix
    ./packages.nix
    ./programs.nix
    ../../modules/home/vscode.nix
    ../../modules/home/fuchsa-cursor.nix
  ];

  home = {
    username = "bree";
    homeDirectory = "/home/bree";
  };

  home.stateVersion = "21.11";
}
