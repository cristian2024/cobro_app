import 'package:cobro_app/bloc/authentication/authentication_bloc.dart';
import 'package:cobro_app/bloc/internet.observer/internet_observer_cubit.dart';
import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/bloc/theme/theme_cubit.dart';
import 'package:cobro_app/repository/authentication/authentication_repository.dart';
import 'package:cobro_app/services/authentication/authentication_service.dart';
import 'package:cobro_app/services/languages/language_service.dart';
import 'package:cobro_app/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BlocConfig extends StatelessWidget {
  const BlocConfig({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(
            ThemeData.dark(),
            service: Provider.of<ThemeService>(
              context,
              listen: false,
            ),
          )..getInitialTheme(),
        ),
        BlocProvider(
          create: (context) => InternetObserverCubit(),
        ),
        BlocProvider(
          create: (context) => LanguagesCubit(
            service: Provider.of<LanguageService>(context, listen: false),
          )..loadLanguage(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            service: Provider.of<AuthenticationService>(
              context,
              listen: false,
            ),
            repository: RepositoryProvider.of<AuthenticationRepository>(
              context,
              listen: false,
            ),
          ),
        )
      ],
      child: child,
    );
  }
}

enum ReqStatus {
  noSubmitted,
  inProgress,
  success,
  fail,
}
