import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_redirector.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/models/accounts/account_model.dart';
import 'package:cobro_app/ui/accounts/screens/account_screen.dart';
import 'package:cobro_app/ui/accounts/screens/accounts_screen.dart';
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
              initialRoute: '/$routeName/${AccountsScreen.routeName}',
              onGenerateRoute: (settings) {
                Widget page = Container();
                final arguments = settings.arguments;
                switch (settings.name) {
                  case AccountsScreen.routeName:
                    page = const AccountsScreen();
                    break;
                  case AccountScreen.routeName:
                    if (arguments is AccountModel) {
                      page = AccountScreen(account: arguments);
                    }
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
