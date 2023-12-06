[//]: # (# vpn_info)

[//]: # ()
[//]: # ([![Pub]&#40;https://img.shields.io/pub/v/vpn_info&#41;]&#40;https://pub.dev/packages/vpn_info&#41;)

[//]: # ([![License: <License>]&#40;https://img.shields.io/badge/License-<License>-brightgreen.svg&#41;]&#40;https://opensource.org/licenses/<License>&#41;)

[//]: # ()
[//]: # (A Flutter package that provides utilities for checking VPN connection status and obtaining details about the connected VPN.)

[//]: # ()
[//]: # (> Note: This package is in active development. Feel free to use it, and contributions are welcome.)

[//]: # ()
[//]: # (## Table of Contents)

[//]: # ()
[//]: # (- [Installation]&#40;#installation&#41;)

[//]: # (- [Usage]&#40;#usage&#41;)

[//]: # (- [Functions]&#40;#functions&#41;)

[//]: # (- [Example]&#40;#example&#41;)

[//]: # (- [Issues]&#40;#issues&#41;)

[//]: # (- [Contributing]&#40;#contributing&#41;)

[//]: # (- [License]&#40;#license&#41;)

[//]: # ()
[//]: # (## Installation)

[//]: # ()
[//]: # (Paste this in terminal:)

[//]: # (```)

[//]: # ()
[//]: # (flutter pub add vpn_info)

[//]: # ()
[//]: # (```)

[//]: # ()
[//]: # (This will add `vpn_info` to your `pubspec.yaml` file:)

[//]: # ()
[//]: # (```yaml)

[//]: # (dependencies:)

[//]: # (  vpn_info: ^1.0.)

[//]: # (```)

[//]: # ()
[//]: # (## Usage)

[//]: # ()
[//]: # (Import the package:)

[//]: # (```dart)

[//]: # ()
[//]: # (import 'package:vpn_info/vpn_info.dart';)

[//]: # ()
[//]: # (```)

[//]: # ()
[//]: # (## Functions)

[//]: # ()
[//]: # (`Future<bool> isVpnConnected&#40;&#41;`)

[//]: # ()
[//]: # (Check if the device has an active VPN connection.)

[//]: # ()
[//]: # (```dart)

[//]: # ()
[//]: # (bool vpnConnected = await VpnInfo.isVpnConnected&#40;&#41;;)

[//]: # ()
[//]: # (```)

[//]: # (`Future<String?> getConnectedVpnInterfaceName&#40;&#41;`)

[//]: # ()
[//]: # (Get the name of the connected VPN interface.)

[//]: # ()
[//]: # (```dart)

[//]: # ()
[//]: # (String? vpnInterfaceName = await VpnInfo.getConnectedVpnInterfaceName&#40;&#41;;)

[//]: # ()
[//]: # (```)

[//]: # ()
# vpn_info

[![Pub](https://img.shields.io/pub/v/vpn_info)](https://pub.dev/packages/vpn_info)
[![License: BSD 2-Clause "Simplified"](https://img.shields.io/badge/License-BSD%202--Clause%20%22Simplified%22-brightgreen.svg)](https://opensource.org/licenses/BSD-2-Clause)

A Flutter package that provides utilities for checking VPN connection status and obtaining details about the connected VPN.

> Note: This package is in active development. Feel free to use it, and contributions are welcome.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Methods](#methods)
- [Example](#example)
- [Issues](#issues)
- [Contributing](#contributing)

## Installation

Add `vpn_info` to your `pubspec.yaml` file:

```yaml

dependencies:
  vpn_info: ^1.0.0

```


Run the following command to install the package:

```

$ flutter pub get

```

## Usage

Import the package:


```dart

import 'package:vpn_info/vpn_info.dart';

```

## Methods

### `Future<bool> isVpnConnected()`

Check if the device has an active VPN connection.


```dart

bool vpnConnected = await VpnInfo.isVpnConnected();

```


### `Future<String?> getConnectedVpnInterfaceName()`

Get the name of the connected VPN interface.

```dart

String? vpnInterfaceName = await VpnInfo.getConnectedVpnInterfaceName();

```
### `Stream<bool> vpnConnectionStream()`

Listen to real-time changes in VPN connection status.

```dart

StreamSubscription<bool> subscription = VpnInfo.vpnConnectionStream().listen((vpnConnected) {
  print('VPN Connection Status: $vpnConnected');
});

// Don't forget to cancel the subscription when it's no longer needed.
// subscription.cancel();

```
## Example

```dart

import 'package:flutter/material.dart';
import 'package:vpn_info/vpn_info.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

// Check if VPN is connected
bool vpnConnected = await VpnInfo.isVpnConnected();
print('VPN connected: $vpnConnected');

// Get connected VPN interface name
String? vpnInterfaceName = await VpnInfo.getConnectedVpnInterfaceName();
print('Connected VPN Interface: $vpnInterfaceName');

// Listen to real-time changes in VPN connection status
StreamSubscription<bool> subscription = VpnInfo.vpnConnectionStream().listen((vpnConnected) {
print('VPN Connection Status: $vpnConnected');
});

// Don't forget to cancel the subscription when it's no longer needed.
// subscription.cancel();
}

```

## Issues

Found a bug or have a feature request? Create an issue on the [GitHub Issues](https://github.com/advaitkale01/vpn_info/issues) page.

## Contributing

Contributions are welcome! Fork the repo, make your changes, and submit a pull request.
