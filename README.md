# vpn_info

[![Pub](https://img.shields.io/pub/v/vpn_info)](https://pub.dev/packages/vpn_info)
[![License: <License>](https://img.shields.io/badge/License-<License>-brightgreen.svg)](https://opensource.org/licenses/<License>)

A Flutter package that provides utilities for checking VPN connection status and obtaining details about the connected VPN.

> Note: This package is in active development. Feel free to use it, and contributions are welcome.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Functions](#functions)
- [Example](#example)
- [Issues](#issues)
- [Contributing](#contributing)
- [License](#license)

## Installation

Paste this in terminal:
```

flutter pub add vpn_info

```

This will add `vpn_info` to your `pubspec.yaml` file:

```yaml
dependencies:
  vpn_info: ^1.0.
```

## Usage

Import the package:
```dart

import 'package:vpn_info/vpn_info.dart';

```

## Functions

`Future<bool> isVpnConnected()`
Check if the device has an active VPN connection.

```dart

bool vpnConnected = await VpnInfo.isVpnConnected();

```
`Future<String?> getConnectedVpnInterfaceName()`
Get the name of the connected VPN interface.