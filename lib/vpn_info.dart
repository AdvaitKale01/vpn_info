library vpn_info;

import 'dart:async';
import 'dart:io';

class VpnInfo {
  final _vpnStatusController = StreamController<bool>.broadcast();

  /// Stream to listen for real-time changes in VPN connection status
  Stream<bool> get vpnStatusStream => _vpnStatusController.stream;

  /// Returns true if the device has a VPN connection
  Future<bool> isVpnConnected() async {
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

      // Notify listeners about the VPN connection status
      _vpnStatusController.add(hasVpnConnection);

      return hasVpnConnection;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns the name of the connected VPN interface
  Future<String?> getConnectedVpnInterfaceName() async {
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

  /// Dispose of the stream controller when it's no longer needed
  void dispose() {
    _vpnStatusController.close();
  }
}
