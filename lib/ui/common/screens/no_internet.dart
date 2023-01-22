import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:cobro_app/ui/main.ui/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  static const routeName = 'no_internet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<InternetObserverCubit, ConnectivityDataState>(
        listener: (context, state) {
          if (state.verifyOnline) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/${InitialPage.routeName}',
              (route) => false,
            );
          }
        },
        child: SizedBox(
          width: double.infinity,
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
  }
}
