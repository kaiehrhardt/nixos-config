{ config, pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;
}