# NVIDIA workstation module. Import from any host with an NVIDIA GPU.
{ config, pkgs, lib, ... }:
{
  # OpenGL / video acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;   # needed for Steam / 32-bit apps
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;      # required for Wayland (your SDDM/Plasma6 is Wayland)

    # Suspend/resume fixes. Keep on for a desktop; harmless.
    powerManagement.enable = true;
    powerManagement.finegrained = false;   # finegrained is for laptop Optimus, not a desktop

    # Use the open kernel modules only on Turing (RTX 20xx) or newer.
    # If you have an older card (GTX 10xx/16xx), set this to false.
    open = true;

    nvidiaSettings = true;          # nvidia-settings GUI

    # Pin a driver branch if needed; default is the stable production driver.
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
