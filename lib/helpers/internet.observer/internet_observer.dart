// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetObserver {
  //Singleton variables
  InternetObserver._();
  static final _instance = InternetObserver._();
  static InternetObserver get instance => _instance;

  final _networkConnectivity = Connectivity();
  final _controller = StreamController<ConnectivityData>.broadcast();

  //stream with the connections info
  Stream<ConnectivityData> get connectionStream => _controller.stream;

  // creates the internet listeners
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  // validates if user is correctly connected to the internet
  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink
        .add(ConnectivityData(connectivity: result, isOnline: isOnline));
  }

  void disposeStream() => _controller.close();
}

class ConnectivityData {
  late ConnectivityResult connectivity;
  late bool isOnline;
  ConnectivityData({
    required this.connectivity,
    required this.isOnline,
  });

  ConnectivityData.initial() {
    connectivity = ConnectivityResult.none;
    isOnline = false;
  }

  bool get verifyOnline {
    return (connectivity == ConnectivityResult.mobile ||
            connectivity == ConnectivityResult.wifi) &&
        isOnline;
  }
}
