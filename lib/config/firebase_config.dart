import 'package:cobro_app/firebase_options.dart';
import 'package:cobro_app/ui/common/widgets/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseConfig extends StatelessWidget {
  const FirebaseConfig({
    super.key,
    required this.child,
  });

  Future<FirebaseApp> cofigureFirebase() async => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: cofigureFirebase(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        }
        return child;
      },
    );
  }
}
