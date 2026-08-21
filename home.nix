{ config, pkgs, ... }:
{
  imports = [ ./plasma.nix ];

  home.username = "elo";
  home.homeDirectory = "/home/elo";
  home.stateVersion = "26.05";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      ls = "eza";
      ll = "eza -lah --git";
      la = "eza -a";
      lt = "eza --tree --level=4";
      rebuild-avm = "sudo nixos-rebuild switch --flake ~/nixos-config#avm";
      rebuild-laptop = "sudo nixos-rebuild switch --flake ~/nixos-config#laptop";
      rebuild-beast = "sudo nixos-rebuild switch --flake ~/nixos-config#beast";
      update = "cd ~/nixos-config && nix flake update";
      gs = "git status";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
        "docker"
        "direnv"
      ];
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "eloquence1";
      user.email = "davidhermans@gmail.com";
   };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
 
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--header"      
    ];
  };  

  # Let HM overwrite this generated file instead of backing it up —
  # stops the recurring ".hm-backup would be clobbered" switch failure.
  xdg.configFile."fontconfig/conf.d/10-hm-fonts.conf".force = true;

  home.packages = with pkgs; [
    # user-level packages go here instead of environment.systemPackages
  ];
}
