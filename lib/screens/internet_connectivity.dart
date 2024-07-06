import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InternetConnectivity extends StatefulWidget {
  @override
  _InternetConnectivityState createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  late ConnectivityResult _connectivityResult;

  @override
  void initState() {
    super.initState();
    _connectivityResult = ConnectivityResult.none;
    _startMonitoring();
  }

  void _startMonitoring() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        Fluttertoast.showToast(msg: "Connected to the Internet");
      } else {
        Fluttertoast.showToast(msg: "No Internet Connection");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // This is a utility widget, so no UI is needed.
  }
}
