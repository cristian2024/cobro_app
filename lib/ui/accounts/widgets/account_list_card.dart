import 'package:cached_network_image/cached_network_image.dart';
import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/ui/accounts/screens/account_screen.dart';
import 'package:cobro_app/ui/accounts/screens/accounts_screen.dart';
import 'package:cobro_app/ui/common/widgets/buttons/minimalist_button.dart';
import 'package:cobro_app/ui/common/widgets/buttons/ripple_button.dart';
import 'package:cobro_app/utils/size_screen.dart';
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
      onTap: _onTap,
      child: Column(
        children: [
          Row(
            children: [
              MinimalistButton(
                onTap: _onTap,
                width: SizeScreens.width(context, 80),
                height: SizeScreens.width(context, 80),
                padding: const EdgeInsets.all(10),
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
              Text(
                account.name,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
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

  _onTap() {
    Utils.mainNav.currentState?.pushNamed(
      AccountScreen.routeName,
      arguments: account,
    );
  }
}
