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

  virtualisation.docker.enable = true;

  users.users.kai = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # sys
    tree
    # web
    curl
    wget
    # ide
    vim
    vscode
    # languages + deps
    (python39.withPackages(ps: with ps; [ requests ]))
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

  fileSystems."/mnt/share" = {
    device = "192.168.178.52:/data";
    fsType = "nfs";
    options = [
      "nfsvers=4.2"
    ];
  };

  system.stateVersion = "21.05";
}
