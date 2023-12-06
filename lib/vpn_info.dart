library vpn_info;

import 'dart:async';
import 'dart:io';

class VpnInfo {
  /// Returns true if the device has a VPN connection
  static Future<bool> isVpnConnected() async {
    try {
      final networkInterfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.any,
      );

      bool hasVpnConnection = networkInterfaces.any((interface) {
        final vpnPatterns = [
          "tun",
          "tap",
          "ppp",
          "pptp",
          "l2tp",
          "ipsec",
          "vpn"
        ];
        return vpnPatterns
            .any((pattern) => interface.name.toLowerCase().contains(pattern));
      });

      return hasVpnConnection;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns the name of the connected VPN interface
  static Future<String?> getConnectedVpnName() async {
    try {
      final networkInterfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.any,
      );

      for (var interface in networkInterfaces) {
        final vpnPatterns = [
          "tun",
          "tap",
          "ppp",
          "pptp",
          "l2tp",
          "ipsec",
          "vpn"
        ];
        for (var pattern in vpnPatterns) {
          if (interface.name.toLowerCase().contains(pattern)) {
            // print(interface.index);
            // print(interface.addresses);
            // print(interface.name);
            return interface.name;
          }
        }
      }

      // Return null if no VPN connection is found
      return null;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<InternetAddress>?> getConnectedVpnAddresses() async {
    try {
      final networkInterfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.any,
      );

      for (var interface in networkInterfaces) {
        final vpnPatterns = [
          "tun",
          "tap",
          "ppp",
          "pptp",
          "l2tp",
          "ipsec",
          "vpn"
        ];
        for (var pattern in vpnPatterns) {
          if (interface.name.toLowerCase().contains(pattern)) {
            // print(interface.index);
            // print(interface.addresses);
            // print(interface.name);
            return interface.addresses;
          }
        }
      }

      // Return null if no VPN connection is found
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
