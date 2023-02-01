import 'package:cached_network_image/cached_network_image.dart';
import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/ui/accounts/screens/accounts_screen.dart';
import 'package:cobro_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
    required this.account,
  });

  static const routeName = 'account';

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Utils.mainNav.currentState?.pop(),
        child: Container(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: '${AccountsScreen.heroTag}${account.hashCode}',
            child: Builder(
              builder: (context) {
                if ((account.imgUrl ?? '').isEmpty) {
                  return Container();
                }
                return CachedNetworkImage(
                  imageUrl: account.imgUrl!,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
