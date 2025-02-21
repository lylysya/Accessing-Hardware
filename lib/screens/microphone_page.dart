import 'package:flutter/material.dart';

class MicrophonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Microphone")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Record & Playback Audio", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
