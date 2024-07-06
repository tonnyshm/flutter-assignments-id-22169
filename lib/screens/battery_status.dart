import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BatteryStatus extends StatefulWidget {
  @override
  _BatteryStatusState createState() => _BatteryStatusState();
}

class _BatteryStatusState extends State<BatteryStatus> {
  final Battery _battery = Battery();

  @override
  void initState() {
    super.initState();
    _monitorBatteryStatus();
  }

  void _monitorBatteryStatus() {
    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      int batteryLevel = await _battery.batteryLevel;
      if (batteryLevel >= 90) {
        Fluttertoast.showToast(msg: "Battery is at $batteryLevel%");
        // Add code to ring (optional, platform-specific implementation needed)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // This is a utility widget, so no UI is needed.
  }
}
