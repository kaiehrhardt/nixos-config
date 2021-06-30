{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./localization.nix
    ./network.nix
    ./user.nix
    ./display.nix
    ./pkg.nix
    ./vscode-helper.nix
  ];

  vscode.user = "kai";
  vscode.homeDir = "/home/kai"; 
  vscode.extensions = with pkgs.vscode-extensions; [
    bbenoist.Nix
    yzhang.markdown-all-in-one
    ms-python.python
    jnoortheen.nix-ide
  ]; 

  # override programs.bash.promptInit
  environment.etc = {
    "bashrc.local" = {
      source = "/etc/nixos/config/bashrc";
    };
    gitconfig = {
      source = "/etc/nixos/config/gitconfig";
    };
  };

  system.stateVersion = "21.05";
}
