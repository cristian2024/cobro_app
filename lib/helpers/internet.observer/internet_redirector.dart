import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_observer.dart';
import 'package:cobro_app/ui/common/screens/no_internet.dart';
import 'package:cobro_app/ui/main.ui/main_page.dart';
import 'package:cobro_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetRedirector extends StatefulWidget {
  const InternetRedirector({
    super.key,
    required this.child,
  });
  static const String routeName = 'internet_redirector';
  final Widget child;

  @override
  State<InternetRedirector> createState() => _InternetRedirectorState();
}

class _InternetRedirectorState extends State<InternetRedirector> {
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
  void connectivityListener(ConnectivityDataState event) {
    if (mounted) {
      BlocProvider.of<InternetObserverCubit>(context).changeData(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetObserverCubit, ConnectivityDataState>(
      listener: (context, state) {
        if (mounted) {
          String routeName = ModalRoute.of(context)?.settings.name ?? '';
          if (!state.verifyOnline) {
            if (routeName != '/${NoInternet.routeName}') {
              Utils.mainNav.currentState?.pushNamedAndRemoveUntil(
                '/${NoInternet.routeName}',
                (route) => false,
              );
            }
          } else {
            if (routeName != MainPage.routeName) {
              Utils.mainNav.currentState?.pushNamedAndRemoveUntil(
                
                MainPage.routeName,
                (route) => false,
              );
            }
          }
        }
      },
      child: widget.child,
    );
  }
}
