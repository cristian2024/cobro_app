import 'package:cobro_app/bloc/bloc_config.dart';
import 'package:cobro_app/bloc/theme/theme_cubit.dart';
import 'package:cobro_app/config/firebase_config.dart';
import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/services/services_config.dart';
import 'package:cobro_app/repository/repositories_config.dart';
import 'package:cobro_app/ui/accounts/screens/account_screen.dart';
import 'package:cobro_app/ui/routes.dart';
import 'package:cobro_app/utils/utils.dart';
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
          child: FirebaseConfig(
            child: BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, state) {
                return MaterialApp(
                  navigatorKey: Utils.mainNav,
                  title: 'Cobro',
                  theme: state,
                  routes: AppRoutes.routes,
                  initialRoute: AppRoutes.initialRoute,
                  onGenerateRoute: (settings) {
                    final arguments = settings.arguments;
                    Widget? page;

                    switch (settings.name) {
                      case AccountScreen.routeName:
                        if (arguments is AccountModel) {
                          page = AccountScreen(account: arguments);
                        }
                        break;
                    }
                    if (page != null) {
                      return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page!,
                      );
                    }
                    return null;
                  },
                  onUnknownRoute: (RouteSettings settings) {
                    return MaterialPageRoute<void>(
                      settings: settings,
                      builder: (BuildContext context) => const Scaffold(
                        body: Center(
                          child: Text('Not Found'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _UnknownRoute extends StatelessWidget {
  const _UnknownRoute();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Not Found'),
      ),
    );
  }
}
