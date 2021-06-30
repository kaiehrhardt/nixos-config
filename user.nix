{ config, pkgs, ... }:
{
  users.users.kai = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
  };
}