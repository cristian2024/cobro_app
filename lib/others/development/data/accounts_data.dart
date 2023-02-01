import 'dart:math';

import 'package:cobro_app/models/accounts/account_model.dart';

class AccData {
  static final listData = [
    AccountModel(
      name: 'hola',
      initialValue: Random().nextDouble(),
      imgUrl:
          'https://i0.wp.com/www.aprendemasingles.com/wp-content/uploads/2014/04/hundred-dollar-bills.jpeg?w=1698&ssl=1',
    ),
    AccountModel(
      name: 'adios',
      initialValue: Random().nextDouble(),
      imgUrl:
          'https://i0.wp.com/www.aprendemasingles.com/wp-content/uploads/2016/09/7658284016_71661b1a78_z.jpg?w=640&ssl=1',
    ),
    AccountModel(
      name: 'que tal',
      initialValue: Random().nextDouble(),
      imgUrl:
          'https://i0.wp.com/aprendemasingles.com/wp-content/uploads/2014/10/venus-ohara-sebas-romero.jpg',
    ),
  ];
}
