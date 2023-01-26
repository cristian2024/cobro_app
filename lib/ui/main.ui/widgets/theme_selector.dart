import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/bloc/theme/theme_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/ui/theme.dart';
import 'package:cobro_app/ui/common/widgets/buttons/minimalist_button.dart';
import 'package:cobro_app/utils/size_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<LanguagesCubit, Language>(
          builder: (context, state) {
            return Text(state.themeSelectorTitle);
          },
        ),
        SizedBox(
          height: SizeScreens.height(context, 20),
        ),
        BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MinimalistButton(
                  icon: Icons.light_mode_outlined,
                  padding: const EdgeInsets.all(10),
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context).changeColorTheme(
                      ThemeOptions.light,
                    );
                  },
                ),
                MinimalistButton(
                  icon: Icons.dark_mode_outlined,
                  padding: const EdgeInsets.all(10),
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context).changeColorTheme(
                      ThemeOptions.dark,
                    );
                  },
                ),
                MinimalistButton(
                  icon: Icons.auto_mode_outlined,
                  padding: const EdgeInsets.all(10),
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context).changeColorTheme(
                      ThemeOptions.semi,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
