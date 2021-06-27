{ config, lib, pkgs, modulesPath, ... }:
{
  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/aeae33ae-94e3-4788-ae4a-f535f63316ad";
      fsType = "ext4";
    };
  swapDevices = [ ];
  virtualisation.virtualbox.guest.enable = true;
}
