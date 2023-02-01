import 'package:cached_network_image/cached_network_image.dart';
import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/ui/accounts/screens/account_screen.dart';
import 'package:cobro_app/ui/accounts/screens/accounts_screen.dart';
import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:cobro_app/utils/utils.dart';
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
      onTap: () {
        Utils.drawerNav.currentState?.pushNamed(
          AccountScreen.routeName,
          arguments: account,
        );
      },
      child: Column(
        children: [
          Hero(
            tag: '${AccountsScreen.heroTag}${account.hashCode}',
            child: Builder(
              builder: (context) {
                if ((account.imgUrl ?? '').isEmpty) {
                  return Container();
                }
                // return Container();
                return CachedNetworkImage(
                  imageUrl: account.imgUrl!,
                );
              },
            ),
          ),
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
