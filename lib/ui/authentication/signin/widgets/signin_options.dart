import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/common/widgets/buttons/minimalist_button.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninOptions extends StatelessWidget {
  const SigninOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            BlocBuilder<LanguagesCubit, Language>(
              builder: (context, state) {
                return Text(state.signInOptionsTitle);
              },
            ),
            Expanded(
              child: Divider(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeScreens.height(context, 15),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MinimalistButton(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: const Icon(
                  FontAwesomeIcons.google,
                ),
              ),
            ),
            MinimalistButton(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: const Icon(
                  FontAwesomeIcons.facebook,
                ),
              ),
            ),
            MinimalistButton(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: const Icon(
                  FontAwesomeIcons.github,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
