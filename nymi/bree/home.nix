{ config, pkgs, ... }:
{
  imports = [
    ./config.nix
    ./packages.nix
    ./programs.nix
    ../../modules/home/vscode.nix
  ];

  home = {
    username = "bree";
    homeDirectory = "/home/bree";
  };

  home.stateVersion = "21.11";
}
