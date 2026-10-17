{ pkgs, packages, ... }:

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
      rpcs3

      # Development
      dotnet-sdk_11
      clang
      rustup
      nodejs
      pnpm
      deno

      ols
      odin

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
    ])
    ++ (with packages; [
      # Utils / Tools
      hexpat-lsp
      # tower-unite-cache-thumbnailer
    ]);
}
