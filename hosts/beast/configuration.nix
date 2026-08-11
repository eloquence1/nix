{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix     # placeholder; regenerate on the target after install
    ../../modules/base.nix
    ../../modules/desktop.nix
    ../../modules/dev.nix
    ../../modules/users.nix
    ../../modules/network-hardening.nix
    ../../modules/nvidia.nix
  ];

  networking.hostName = "beast";

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  # Desktop rarely has the flaky-NVRAM problem the ThinkPad has; leave true.
  # Flip to false if you hit the same "Failed to create EFI Boot variable" EIO.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;

  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;

  # SSD housekeeping (base.nix already sets boot.tmp.cleanOnBoot)
  services.fstrim.enable = true;

  # A workstation with lots of RAM usually doesn't need zram, but it's cheap
  # insurance and matches the laptop. Remove if you have huge RAM and no swap need.
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.page-cluster" = 0;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.elo = import ../../home.nix;
  };

  # Pinned to the release this system was installed on. Do not bump casually.
  system.stateVersion = "26.11";
}
