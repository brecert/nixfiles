{ config, pkgs, lib, nixpkgs-unstable, packages, specialArgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nix-configuration.nix
      ./fonts.nix
      ../modules/nixos/vr.nix
      ../modules/nixos/ime.nix
      ../modules/nixos/lxqt.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = [ "ntfs" ];
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  boot.kernelParams = [
    "nvidia-drm.modset=1"
    "initcall_blacklist=simpledrm_platform_driver_init"
  ];

  hardware.bluetooth.enable = false;
  hardware.firmware = [ pkgs.linux-firmware ];

  networking.hostName = "nymi";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  networking.interfaces.enp42s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  # networking.wireless.extraConfig = "
  #   freq_list=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 2467 2472 2484
  # ";

  # Enable .local
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    powerManagement.enable = true;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  services.libinput.mouse.accelProfile = "flat";
  services.xserver.xkb.options = "ctrl:swapcaps";
  
  services.earlyoom = {
    enable = true;
    freeSwapThreshold = 3;
    freeMemThreshold = 3;
  };

  # needed to be enabled for default shell
  programs.fish.enable = true;
  users.users.bree = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
  
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.bree = import ./bree/home.nix;
  home-manager.extraSpecialArgs = specialArgs;
  home-manager.backupFileExtension = ".bak.bak";

  environment.systemPackages = with pkgs; [
    micro
  ];

  services.flatpak.enable = true;

  services.gnome.gnome-keyring.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
    libx11
    libice
    libsm
    fontconfig.lib
  ];
  
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = [
    pkgs.proton-ge-bin
  ];

  modules.lxqt.enable = true;
  modules.ime.enable = true;
  modules.vr.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
