{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  time.timeZone = "Europe/Brussels";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "nl_BE.UTF-8";
    LC_MONETARY = "nl_BE.UTF-8";
    LC_PAPER = "nl_BE.UTF-8";
  };

  console.keyMap = "us";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Terminfo for every terminal in nixpkgs — fixes xterm-kitty and friends
  environment.enableAllTerminfo = true;

  environment.systemPackages = with pkgs; [
    git vim wget curl htop tree ripgrep fd unzip pciutils usbutils
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
}
