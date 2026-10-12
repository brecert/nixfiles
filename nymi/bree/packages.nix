{ config, lib, pkgs, packages, ... }:

{
  home.packages =
    (with pkgs; [
      # Applications
      telegram-desktop
      prismlauncher
      sublime-merge
      imhex
      livecaptions
      kooha
      eyedropper

      # bnnuychat development (temporary)
      clang
      rustup
      # nodejs-18_x
      pnpm
      deno

      ols
      odin

      # aoc (temporary)
      ruby
      
      (python3.withPackages(ps: [
        ps.numpy
        ps.scipy
        ps.requests
        ps.setuptools
      ]))
      python3Packages.pyside6
      
      qgnomeplatform-qt6
      adwaita-qt6

      # Nix Utils
      nil
      cachix
      nixpkgs-fmt
      pulseaudioFull
      
      # Gnome
      gnome-boxes
      gnome-tweaks

      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.ddterm
      gnomeExtensions.desktop-cube
      gnomeExtensions.pano
      gnomeExtensions.vitals      
    ])
    ++ (with packages; [
      # Applications
      # rpcs3

      # Utils / Tools
      hexpat-lsp
      # tower-unite-cache-thumbnailer
    ]);
}
