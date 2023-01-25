import 'dart:async';

import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_observer.dart';
import 'package:cobro_app/helpers/internet.observer/internet_redirector.dart';
import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  static const routeName = 'no_internet';

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 2),
      (Timer t) => InternetObserver.instance.checkStatusComplete(),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InternetRedirector(
      child: Builder(builder: (context) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: RippleButton(
              onTap: () {
                BlocProvider.of<InternetObserverCubit>(context).changeData(
                  const ConnectivityDataState.initial(),
                );
                InternetObserver.instance.checkStatusComplete();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.wifi_off),
                  Text('You have no internet connection'),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
