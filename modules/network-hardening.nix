{ config, pkgs, lib, ... }:
{
  # LAN-facing hardening for physically-present hosts (laptop, beast).
  # Not imported by avm — the VM has no reason to accept inbound LAN traffic.

  networking.nftables.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 41952 ];
    openFirewall = false;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "elo" ];
      TCPKeepAlive = true;
    };
  };

  networking.firewall = {
    enable = true;
    filterForward = true;   # drop-policy forward chain
    allowedTCPPorts = [ ];   # nothing open to the world

    extraInputRules = ''
      ip saddr 10.10.25.20  tcp dport 41952 accept
      ip saddr 10.10.25.27  tcp dport 41952 accept
      #ip saddr 10.10.25.102 tcp dport 41952 accept
      ip saddr 10.10.25.27  tcp dport 5201  accept

      # Spotify
      ip saddr 10.10.25.0/24 tcp dport 57621 accept
      ip saddr 10.10.25.0/24 udp dport 5353  accept
    '';
  };

  # Blackhole 10.10.24.0/24 ahead of the main firewall table
  networking.nftables.tables.blackhole = {
    family = "inet";
    content = ''
      chain input {
        type filter hook input priority filter - 10; policy accept;
        ip saddr 10.10.24.0/24 drop
      }
      chain output {
        type filter hook output priority filter - 10; policy accept;
        ip daddr 10.10.24.0/24 drop
      }
      chain forward {
        type filter hook forward priority filter - 10; policy accept;
        ip saddr 10.10.24.0/24 drop
        ip daddr 10.10.24.0/24 drop
      }
    '';
  };
}
