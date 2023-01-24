

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentValues {
  EnvironmentValues({
    required this.cobroBack,
  });
  String cobroBack;
}

class EnvironmentConfig {
  //singleton
  factory EnvironmentConfig(
  ) {
    _instance ??=
        EnvironmentConfig._internal();
    return _instance!;
  }

  EnvironmentConfig._internal()
      : values = EnvironmentValues(
          cobroBack: dotenv.env['SERVER_IP'] ?? '',
        );

  
  static EnvironmentConfig? _instance;
  final EnvironmentValues values;
}
