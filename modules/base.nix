{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    trusted-users = [ "root" "@wheel" ];
    warn-dirty = false;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  boot.kernelPackages = pkgs.linuxPackages_7_1;
  boot.tmp.cleanOnBoot = true;

  security.sudo.execWheelOnly = true;

  programs.nix-ld.enable = true;
  programs.nix-index.enable = true;
  programs.command-not-found.enable = false;

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
