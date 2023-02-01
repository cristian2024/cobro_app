import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/others/development/data/accounts_data.dart';
import 'package:cobro_app/ui/accounts/widgets/account_list_card.dart';
import 'package:cobro_app/ui/common/widgets/buttons/minimalist_button.dart';
import 'package:cobro_app/ui/main.ui/main_page.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  static const heroTag = 'account_tag';

  static const routeName = '${MainPage.routeName}/accounts';

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen>
    with SingleTickerProviderStateMixin {
  bool isList = true;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MinimalistButton(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: AnimatedIcon(
              icon: AnimatedIcons.list_view,
              progress: animation,
            ),
          ),
          onTap: () {
            setState(() {
              isList ? controller.forward() : controller.reverse();
              isList = !isList;
            });
          },
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            // ignore: prefer_const_constructors
            child: ListView.builder(
              itemCount: AccData.listData.length,
              itemBuilder: (context, index) {
                AccountModel account = AccData.listData[index];
                return AccountListCard(
                  account: account,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  IconData get icon {
    if (isList) {
      return Icons.list_outlined;
    }
    return Icons.grid_view_outlined;
  }
}
