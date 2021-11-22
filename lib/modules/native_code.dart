import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCodeScreen extends StatefulWidget {
  @override
  _NativeCodeScreenState createState() => _NativeCodeScreenState();
}

class _NativeCodeScreenState extends State<NativeCodeScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
  String batteryLevel = 'Unknown battery level.';

  void getBatteryLevel() {
    platform
        .invokeMethod('getBatteryLevel')
        .then((value) {
          setState(() {
            batteryLevel = 'Battery level at $value % .';
          });
    })
        .catchError((error) {
          setState(() {
            batteryLevel = "Failed to get battery level: '${error.message}'.";
          });
    });

    /*String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      batteryLevel = batteryLevel;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: getBatteryLevel,
            ),
            Text(batteryLevel),
          ],
        ),
      ),
    );
  }
}
