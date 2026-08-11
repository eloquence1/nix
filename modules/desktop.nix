{ config, pkgs, inputs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Plasma is enabled here, so wire up its declarative counterpart here too.
  # sharedModules applies to every home-manager user on the host.
  home-manager.sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

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
    nerd-fonts.jetbrains-mono
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
    gocryptfs
    gnupg
    pinentry-curses
    vlc
    keepassxc
    lshw
    fzf
    zoxide
    nmap
    pfetch
    spotify
    krita
    gimp
    starship
    neovim
    qemu
    virt-manager
    vscodium
    kdePackages.ktorrent
    kdePackages.kmail
    kdePackages.kgeography
    kdePackages.plasma-vault
    brave
    hollywood
    cmatrix
    ncdu
    claude-code
    blender
    uv
    godot
  ];
}
