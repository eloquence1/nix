{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode          # unfree — needs allowUnfree in base.nix
    neovim

    nodejs_22
    python313
    go
    rustup

    gh
    lazygit
    direnv
    nix-direnv
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
