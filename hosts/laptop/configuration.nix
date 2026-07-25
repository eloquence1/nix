{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/desktop.nix
    ../../modules/dev.nix
    ../../modules/users.nix
  ];

  networking.hostName = "thinkpad";
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_7_1;  

  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  powerManagement.enable = true;
  services.fwupd.enable = true;
  
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      disableWhileTyping = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.elo = import ../../home.nix;
  };
  
  system.stateVersion = "26.05";
}
