{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  networking.hostName = "nixos";
  time.timeZone = "Europe/Berlin";
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;
  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  console.keyMap = "de";
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.layout = "de";
  users.users.kai = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # web
    curl
    wget
    # ide
    vim
    vscode
    # misc
    gitFull
    firefox
  ];
  # override programs.bash.promptInit
  environment.etc = {
    "bashrc.local" = {
      source = "/etc/nixos/bashrc";
    };
    gitconfig = {
      source = "/etc/nixos/gitconfig";
    };
  };
  
  system.stateVersion = "21.05";
}
