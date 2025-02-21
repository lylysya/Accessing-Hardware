import 'package:flutter/material.dart';

class BluetoothPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bluetooth")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bluetooth, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Connect & Transfer Files", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
