{ pkgs, ... }:

let
  allowedIP = "0.0.0.0/0";2
  vpnConfiguration = (import ./user-configuration.nix);
in {
  networking.wg-quick.interfaces = {
    visium_vpn = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      address = [ vpnConfiguration.clientIP ];
      dns = [ vpnConfiguration.dns ];
      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKey = vpnConfiguration.privateKey;
      peers = [
        # For a client configuration, one peer entry for the server will suffice.
        {
          # Public key of the server (not a file path).
          publicKey = vpnConfiguration.publicKey;
          # Forward all the traffic via VPN.
          allowedIPs = [ allowedIP ];
          # Or forward only particular subnets
          # Set this to the server IP and port.
          endpoint = vpnConfiguration.endpoint;
          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
}