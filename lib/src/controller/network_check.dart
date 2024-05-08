import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkCheck extends ChangeNotifier {
  bool isConnected = true;
  void isOnline() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      isConnected = true;
      notifyListeners();
    } else {
      isConnected = false;
      notifyListeners();
    }
  }
}
