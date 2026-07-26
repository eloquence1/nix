{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/desktop.nix
    ../../modules/dev.nix
    ../../modules/users.nix
    ../../modules/network-hardening.nix
  ];

  networking.hostName = "beast";
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;

  # TODO: pick the GPU driver once the hardware is known.
  # AMD:    hardware.graphics.enable = true;
  # NVIDIA: services.xserver.videoDrivers = [ "nvidia" ];
  #         hardware.nvidia.modesetting.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.elo = import ../../home.nix;
  };

  # Set once at first install (nixos-generate-config fills this in
  # automatically); do not change afterwards.
  system.stateVersion = "26.05";
}
