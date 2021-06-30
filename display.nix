{ config, pkgs, ... }:
{
  console.font = "Lat2-Terminus16";
  console.keyMap = "de";

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.layout = "de";
}
