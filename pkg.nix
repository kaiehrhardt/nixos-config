{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    tree
    htop
    curl
    wget
    vim
    (python39.withPackages(ps: with ps; [ requests ]))
    gitFull
    firefox
  ];
}