import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  BluetoothPageState createState() => BluetoothPageState();
}

class BluetoothPageState extends State<BluetoothPage> {
  List<BluetoothDevice> devicesList = [];

  @override
  void initState() {
    super.initState();
    _scanForDevices();
  }

  void _scanForDevices() {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (!devicesList.any((device) => device.remoteId == result.device.remoteId)) {
          setState(() {
            devicesList.add(result.device);
          });
        }
      }
    });

    Future.delayed(const Duration(seconds: 6), () {
      FlutterBluePlus.stopScan();
    });
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      debugPrint("Connected to ${device.platformName}");
    } catch (e) {
      debugPrint("Connection failed: $e");
    }
  }

  Future<void> _disconnectDevice(BluetoothDevice device) async {
    try {
      await device.disconnect();
      debugPrint("Disconnected from ${device.platformName}");
    } catch (e) {
      debugPrint("Disconnection failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bluetooth")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _scanForDevices,
            child: const Text("Scan Devices"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: devicesList.length,
              itemBuilder: (context, index) {
                final device = devicesList[index];
                return ListTile(
                  title: Text(device.platformName.isNotEmpty ? device.platformName : "Unknown Device"),
                  subtitle: Text(device.remoteId.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () => _connectToDevice(device),
                        child: const Text("Connect"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _disconnectDevice(device),
                        child: const Text("Disconnect"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
