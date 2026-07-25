{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    jetbrains-mono
    inter
  ];

  environment.systemPackages = with pkgs; [
    firefox
    btop
    htop
    tmux
    screen
    duf
    fastfetch
    kitty
    kdePackages.plasma-vault
    gocryptfs
    gnupg
    pinentry-curses
    vlc
    keepassxc
  ];

}
