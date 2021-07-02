{ config, lib, pkgs, modulesPath, ... }:
{
  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/aeae33ae-94e3-4788-ae4a-f535f63316ad";
    fsType = "ext4";
  };

  fileSystems."/mnt/share" = {
    device = "192.168.178.52:/";
    fsType = "nfs";
    options = [
      "nfsvers=4.2"
      "users"
    ];
  };

  swapDevices = [ ];
  
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
}
