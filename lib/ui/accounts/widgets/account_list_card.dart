import 'dart:math';

import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:flutter/material.dart';

class AccountListCard extends StatelessWidget {
  const AccountListCard({
    super.key,
    required this.account,
  });

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                account.name,
              ),
            ],
          ),
          LinearProgressIndicator(
            value: value,
          ),
        ],
      ),
    );
  }

  double get value {
    return account.initialValue;
  }
}
