- `networking.networkmanager.firewallBackend` was removed as NixOS is now using
  iptables-nftables-compat even when using iptables, therefore Networkmanager
  uses the nftables backend unconditionally now.
