import 'package:cobro_app/bloc/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          create: (context) => ThemeCubit(ThemeData.dark()),
        ),
      ],
      child: child,
    );
  }
}
