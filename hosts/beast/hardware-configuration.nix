# PLACEHOLDER — this host has not been installed yet.
#
# After booting the installer and partitioning with ./disko.nix, run:
#   nixos-generate-config --no-filesystems --root /mnt
# and replace this entire file with the generated
# /mnt/etc/nixos/hardware-configuration.nix (disko already supplies the
# filesystem/mount entries, hence --no-filesystems).
{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # TODO: replace with the real modules from nixos-generate-config.
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ]; # or "kvm-amd"
  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
