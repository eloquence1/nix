{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/desktop.nix
    ../../modules/dev.nix
    ../../modules/users.nix
  ];

  networking.hostName = "avm";

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 6;
  boot.loader.efi.canTouchEfiVariables = true;
  # systemd in initrd — needed for correct keymap at the LUKS prompt
  boot.initrd.systemd.enable = true;

  # VM guest integration — do NOT copy to the laptop or beast
  services.spice-vdagentd.enable = true;   # clipboard + resolution (QEMU/SPICE)
  services.qemuGuest.enable = true;

  system.stateVersion = "25.05";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.elo = import ../../home.nix;
  };
}
