import 'package:cobro_app/ui/common/widgets/buttons/minimalist_button.dart';
import 'package:cobro_app/ui/main.ui/main_page.dart';
import 'package:flutter/material.dart';

class AccountScreens extends StatefulWidget {
  const AccountScreens({super.key});

  static const routeName = '${MainPage.routeName}/accounts';

  @override
  State<AccountScreens> createState() => _AccountScreensState();
}

class _AccountScreensState extends State<AccountScreens>
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
        Container(
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          child: Text(
            'hola',
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
