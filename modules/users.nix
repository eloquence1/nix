{ config, pkgs, ... }:
{
  users.users.elo = {
    isNormalUser = true;
    description = "elo";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
    initialPassword = "changeme";   # change on first boot

    openssh.authorizedKeys.keys = [
       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDvzMvE02aDyPhT9iGd5zQa2Bu9ZufbObOUpLNkTcndJ elo@thinkpad.home.arpa"
    ];
  };

  security.sudo.wheelNeedsPassword = true;
  programs.zsh.enable = true;
}
