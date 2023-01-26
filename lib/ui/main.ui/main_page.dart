import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_redirector.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/accounts/account_screen.dart';
import 'package:cobro_app/ui/main.ui/widgets/main_drawer.dart';
import 'package:cobro_app/ui/main.ui/widgets/settings_drawer.dart';
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
            body: const DefaultTabController(
              length: 2,
              child: TabBarView(
                
                children: [
                  Tab(
                    text: 'not alarm',
                  ),
                  Tab(
                    text: 'Alarm',
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
