# vpn_info

| Function                                                                           | Android   | iOS     | macOS   | Web     |
| -------                                                                            | :-------: | :-----: | :-----: | :-----: |
| Get VPN State                                                                      | ✅        | ✅      | ✅     | ✅     |
| Get VPN Protocol Name                                                              | ✅        | ✅      | ✅     | ✅     |
| Get VPN IP Addresses                                                               | ✅        | ✅      | ✅     | ✅     |


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

### `Future<String?> getConnectedVpnProtocolName()`

Get the name of the connected VPN interface.

```dart

String? vpnInterfaceName = await VpnInfo.getConnectedVpnProtocolName();

// Perform a null check later in code

```

### `Future<List<InternetAddress>?> getConnectedVpnAddresses()`

Get the IP Address and version of the connected VPN interface as a list of InternetAddress objects.

```dart

List<InternetAddress>? vpnInterfaceName = await VpnInfo.getConnectedVpnAddresses();

// Perform a null check later in code

```

## Example

```dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vpn_info/vpn_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VPN Info"),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('VPN connected:'),
                const SizedBox(width: 10.0),
                FutureBuilder(
                  future: VpnInfo.isVpnConnected(),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('VPN name:'),
                const SizedBox(width: 10.0),
                FutureBuilder(
                  future: VpnInfo.getConnectedVpnProtocolName(),
                  builder: (context, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return Text(
                        'No VPN',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('VPN addresses:'),
                const SizedBox(width: 10.0),
                FutureBuilder(
                  future: VpnInfo.getConnectedVpnAddresses(),
                  builder: (context,
                      AsyncSnapshot<List<InternetAddress>?> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return Text(
                        'No VPN',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


```

## Issues

Found a bug or have a feature request? Create an issue on the [GitHub Issues](https://github.com/advaitkale01/vpn_info/issues) page.

## Contributing

Contributions are welcome! Fork the repo, make your changes, and submit a pull request.
