{ lib
, callPackage
, callPackages
# required inputs
, system
, tower-unite-cache
, ataraxiadev-nur
}:

let 
  self = {
    inherit (tower-unite-cache) tower-unite-cache tower-unite-cache-thumbnailer;

    nm-tray = callPackage ./packages/nm-tray { };

    ueviewer = callPackage ./packages/ueviewer { };
    hexpat-lsp = callPackage ./packages/hexpat-lsp { };
    fuchsia-cursor = callPackage ./packages/fuchsia-cursor { };
    
    # rpcs3 = ataraxiadev-nur.rpcs3;
    rusty-psn = callPackage ./packages/rusty-psn { withGui = false; };
    rusty-psn-gui = callPackage ./packages/rusty-psn { withGui = true; };
    
    gnome-circle = lib.recurseIntoAttrs (callPackages ./packages/gnome/circle.nix { });
  };
in
  self