import 'package:cobro_app/bloc/theme/theme_cubit.dart';
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
      ],
      child: child,
    );
  }
}
