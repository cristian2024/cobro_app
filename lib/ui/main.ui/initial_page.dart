import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:cobro_app/ui/common/screens/no_internet.dart';
import 'package:cobro_app/ui/main.ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});
  static const String routeName = 'initial_route_name';
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetObserverCubit, ConnectivityDataState>(
      listener: (context, state) {
        if (!state.verifyOnline) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/${NoInternet.routeName}',
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('title')),
        endDrawer: const MainDrawer(),
      ),
    );
  }
}
