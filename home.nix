{ config, pkgs, ... }:
{
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
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#vm";
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
    userName = "elo";
    userEmail = "davidhermans@gmail.com";
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

  home.packages = with pkgs; [
    # user-level packages go here instead of environment.systemPackages
  ];
}
