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
                  future: VpnInfo.getConnectedVpnName(),
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
