import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/camera_page.dart';
import 'screens/gps_page.dart';
import 'screens/bluetooth_page.dart';
import 'screens/microphone_page.dart';
import 'screens/accelerometer_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: ThemeData.light().textTheme,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CameraPage(),
    GPSPage(),
    BluetoothPage(),
    MicrophonePage(),
    AccelerometerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "GPS"),
          BottomNavigationBarItem(icon: Icon(Icons.bluetooth), label: "Bluetooth"),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: "Microphone"),
          BottomNavigationBarItem(icon: Icon(Icons.motion_photos_on), label: "Accelerometer"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.settings),
      ),
    );
  }
}
