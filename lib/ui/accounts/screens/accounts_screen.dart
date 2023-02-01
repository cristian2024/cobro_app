import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/others/development/data/accounts_data.dart';
import 'package:cobro_app/ui/accounts/widgets/account_list_card.dart';
import 'package:cobro_app/ui/accounts/widgets/account_square_card.dart';
import 'package:cobro_app/ui/common/widgets/buttons/minimalist_button.dart';
import 'package:cobro_app/ui/main.ui/main_page.dart';
import 'package:cobro_app/utils/size_screen.dart';
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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeScreens.width(context, 16),
        vertical: SizeScreens.height(context, 20),
      ),
      child: Column(
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
          SizedBox(
            height: SizeScreens.height(context, 20),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: list(AccData.listData),
            ),
          ),
        ],
      ),
    );
  }

  IconData get icon {
    if (isList) {
      return Icons.list_outlined;
    }
    return Icons.grid_view_outlined;
  }

  Widget list(List<AccountModel> accounts) {
    if (isList) {
      return ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          AccountModel account = accounts[index];
          return Container(
            margin: EdgeInsets.only(
              bottom: SizeScreens.height(context, 20),
            ),
            child: AccountListCard(
              account: account,
            ),
          );
        },
      );
    } else {
      return GridView.builder(
        itemCount: accounts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeScreens.width(context, 2).round(),
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) {
          AccountModel account = accounts[index];
          return Container(
            margin: EdgeInsets.only(
              bottom: SizeScreens.height(context, 20),
            ),
            child: AccountSquareCard(
              account: account,
            ),
          );
        },
      );
    }
  }
}
