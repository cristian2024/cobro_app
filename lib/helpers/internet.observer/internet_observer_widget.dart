import 'package:cobro_app/helpers/internet.observer/internet_observer.dart';
import 'package:cobro_app/ui/common/widgets/loading.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetObserverWidget extends StatefulWidget {
  const InternetObserverWidget({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  State<InternetObserverWidget> createState() => _InternetObserverWidgetState();
}

class _InternetObserverWidgetState extends State<InternetObserverWidget> {
  late InternetObserver observer;

  @override
  void initState() {
    //init observer data
    observer = InternetObserver.instance;
    setupListeners();
    super.initState();
  }

  @override
  void dispose() {
    observer.disposeStream();

    super.dispose();
  }

  // listeners setup
  void setupListeners() {
    observer.initialise();
    observer.connectionStream.listen(connectivityListener);
  }

  //connection change listener
  void connectivityListener(ConnectivityData event) {
    bool showSnack = false;
    switch (event.connectivity) {
      case ConnectivityResult.mobile:
        showSnack = !event.isOnline;
        break;
      case ConnectivityResult.wifi:
        showSnack = !event.isOnline;
        break;
      default:
    }
    if (showSnack) {
      showSnackbar('You need to be connected to internet');
    }
  }

  //when show a snackbar, ensures that flutter state is already init
  void showSnackbar(String mssg) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SnackBar snackBar = SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        content: Text(
          mssg,
        ),
        duration: const Duration(
          milliseconds: 1500,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityData>(
      stream: observer.connectionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ConnectivityData? data = snapshot.data;
          bool isOnline = data != null &&
              (data.connectivity == ConnectivityResult.mobile ||
                  data.connectivity == ConnectivityResult.wifi) &&
              data.isOnline;
          if (isOnline) {
            return widget.child;
          }
        }
        return const Loading();
      },
    );
  }
}
