import 'package:cobro_app/bloc/bloc_config.dart';
import 'package:cobro_app/bloc/theme/theme_cubit.dart';
import 'package:cobro_app/config/firebase_config.dart';
import 'package:cobro_app/helpers/internet.observer/internet_observer_widget.dart';
import 'package:cobro_app/services/services_config.dart';
import 'package:cobro_app/repository/repositories_config.dart';
import 'package:cobro_app/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CobroApp());
}

class CobroApp extends StatelessWidget {
  const CobroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ServicesConfig(
      child: RepositoriesConfig(
        child: BlocConfig(
          child: InternetObserverWidget(
            child: FirebaseConfig(
              child: BlocBuilder<ThemeCubit, ThemeData>(
                builder: (context, state) {
                  return MaterialApp(
                    title: 'Cobro',
                    theme: state,
                    routes: AppRoutes.routes,
                    initialRoute: AppRoutes.initialRoute,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
