import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_redirector.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/accounts/account_screen.dart';
import 'package:cobro_app/ui/accounts/account_screen1.dart';
import 'package:cobro_app/ui/accounts/account_screen2.dart';
import 'package:cobro_app/ui/main.ui/widgets/main_drawer.dart';
import 'package:cobro_app/ui/main.ui/widgets/settings_drawer.dart';
import 'package:cobro_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const routeName = '/initial_route_name';
  @override
  Widget build(BuildContext context) {
    return InternetRedirector(
      child: BlocBuilder<LanguagesCubit, Language>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.appBarTitle1),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: 'App settings',
                  ),
                ),
              ],
            ),
            drawer: const MainDrawer(),
            endDrawer: const SettingsDrawer(),
            body: Navigator(
              key: Utils.drawerNav,
              initialRoute: '/$routeName/${AccountScreens.routeName}',
              onGenerateRoute: (settings) {
                Widget page = Container();
                switch (settings.name) {
                  case AccountScreens.routeName:
                    page = const AccountScreens();
                    break;
                  case AccountScreens1.routeName:
                    page = const AccountScreens1();
                    break;
                  case AccountScreens2.routeName:
                    page = const AccountScreens2();
                    break;
                  default:
                    page = Container();
                    break;
                }
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
