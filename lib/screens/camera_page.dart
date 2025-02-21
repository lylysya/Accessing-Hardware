import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Capture Photos & Videos", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
