import 'package:cobro_app/services/authentication/authentication_service.dart';
import 'package:cobro_app/services/languages/language_service.dart';
import 'package:cobro_app/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ServicesConfig extends StatelessWidget {
  const ServicesConfig({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => GoogleSignIn(),
        ),
        Provider(
          create: (context) => ThemeService(),
        ),
        Provider(
          create: (context) => LanguageService(),
        ),
        Provider(
          create: (context) => AuthenticationService(
            google: Provider.of<GoogleSignIn>(context, listen: false),
          ),
        ),
      ],
      child: child,
    );
  }
}
