import 'package:cobro_app/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersConfig extends StatelessWidget {
  const ProvidersConfig({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ThemeService(),
        ),
      ],
      child: child,
    );
  }
}
