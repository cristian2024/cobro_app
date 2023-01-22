import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  // listeners setup
  void setupListeners() {
    observer.initialise();
    observer.connectionStream.listen(connectivityListener);
  }

  //connection change listener
  void connectivityListener(ConnectivityDataState event) =>
      BlocProvider.of<InternetObserverCubit>(context).changeDate(event);

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
    return widget.child;
  }
}
