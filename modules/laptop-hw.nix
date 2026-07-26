{ config, pkgs, lib, ... }:
{
  # Physical-laptop concerns only: battery, thermals, touchpad, suspend-friendly swap.
  # Not applicable to avm (no hardware) or beast (desktop, no battery/touchpad).

  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "powersave";

  services.fwupd.enable = true;
  services.thermald.enable = true;
  services.fstrim.enable = true;

  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      disableWhileTyping = true;
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 60;
    "vm.page-cluster" = 0;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
  };
}
