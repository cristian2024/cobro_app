import 'package:cobro_app/repository/authentication/authentication_repository.dart';
import 'package:cobro_app/repository/initial.repository/initial_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoriesConfig extends StatelessWidget {
  const RepositoriesConfig({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => InitialRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        ),
      ],
      child: child,
    );
  }
}
