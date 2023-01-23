import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/helpers/internet.observer/internet_redirector.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/authentication/signin/signin_screen.dart';
import 'package:cobro_app/ui/common/widgets/buttons/common_button.dart';
import 'package:cobro_app/ui/main.ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});
  static const String routeName = 'initial_route_name';
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
            endDrawer: const MainDrawer(),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: CommonButton(
                      text: state.signInButtonText,
                      onClick: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/${SigninScreen.routeName}',
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
