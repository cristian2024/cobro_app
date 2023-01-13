import 'package:cobro_app/bloc/theme/theme_cubit.dart';
import 'package:cobro_app/ui/widgets/buttons/minimalist_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Theme selector'),
        const SizedBox(
          height: 10,
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
                      ThemeData.light(),
                    );
                  },
                ),
                MinimalistButton(
                  icon: Icons.dark_mode_outlined,
                  padding: const EdgeInsets.all(10),
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context).changeColorTheme(
                      ThemeData.dark(),
                    );
                  },
                ),
                MinimalistButton(
                  icon: Icons.auto_mode_outlined,
                  padding: const EdgeInsets.all(10),
                  onTap: () {
                    //obtaining the theme value for context
                    bool isDark = MediaQuery.of(context).platformBrightness ==
                        Brightness.dark;
                    ThemeData theme = ThemeData.light();
                    if (isDark) {
                      theme = ThemeData.dark();
                    }
                    BlocProvider.of<ThemeCubit>(context).changeColorTheme(
                      theme,
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
