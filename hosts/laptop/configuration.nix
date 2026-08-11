{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/desktop.nix
    ../../modules/dev.nix
    ../../modules/users.nix
    ../../modules/network-hardening.nix
    ../../modules/laptop-hw.nix
  ];

  networking.hostName = "thinkpad";
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.initrd.systemd.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.elo = import ../../home.nix;
  };

  system.stateVersion = "26.05";
}
