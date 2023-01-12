import 'package:cobro_app/bloc/bloc_config.dart';
import 'package:cobro_app/repository/repositories_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoriesConfig(
        child: BlocConfig(
          child: Container(),
        ),
      ),
    );
  }
}
