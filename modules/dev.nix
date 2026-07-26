{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nodejs_22
    python313
    go
    rustup

    gh
    lazygit
    jq
    httpie
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  virtualisation.docker.enable = true;

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
