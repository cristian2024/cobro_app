import 'dart:math';

import 'package:cobro_app/models/accounts/account_model.dart';

class AccData {
  static final listData = [
    AccountModel(
      name: 'hola',
      initialValue: Random().nextDouble(),
    ),
    AccountModel(name: 'adios',
      initialValue: Random().nextDouble(),
    ),
    AccountModel(name: 'que tal',
      initialValue: Random().nextDouble(),
    ),
  ];
}
