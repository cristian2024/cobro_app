import 'dart:async';
import 'dart:io';
import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetObserver {
  //Singleton variables
  InternetObserver._();
  static final _instance = InternetObserver._();
  static InternetObserver get instance => _instance;

  final _networkConnectivity = Connectivity();
  final _controller = StreamController<ConnectivityDataState>.broadcast();

  //stream with the connections info
  Stream<ConnectivityDataState> get connectionStream => _controller.stream;

  // creates the internet listeners
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      checkStatus(result);
    });
  }

  void checkStatusComplete() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    checkStatus(result);
  }

  // validates if user is correctly connected to the internet
  void checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    //adding data obtained of search
    _controller.sink.add(
      ConnectivityDataState(
        connectivity: result,
        isOnline: isOnline,
      ),
    );
  }

  void disposeStream() => _controller.close();
}
