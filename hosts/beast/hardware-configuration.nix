# PLACEHOLDER — hand-written so the flake evaluates before beast exists.
#
# After the first boot on the real machine, regenerate and replace this file:
#   sudo nixos-generate-config --no-filesystems --show-hardware-config \
#     > ~/nixos-config/hosts/beast/hardware-configuration.nix
#
# --no-filesystems matters: disko.nix owns fileSystems/swapDevices, and a
# generated fileSystems block would collide with it.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Generic desktop set: NVMe + SATA + USB boot paths. The real scan may add
  # or drop entries; that is what the regenerate step above is for.
  boot.initrd.availableKernelModules = [
    "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];   # LVM-on-LUKS root
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
