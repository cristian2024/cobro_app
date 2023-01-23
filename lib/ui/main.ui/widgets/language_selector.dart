import 'package:cobro_app/bloc/languages/languages_cubit.dart';
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/languages/language_list.dart';
import 'package:cobro_app/ui/common/widgets/forms/common_dropdown_form_field.dart';
import 'package:cobro_app/ui/common/widgets/language_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<LanguagesCubit, Language>(
          builder: (context, state) {
            return Text(state.languageSelectorTitle);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<LanguagesCubit, Language>(
          builder: (context, state) {
            return CommonDropdownFormField<Language>(
              value: state,
              onChange: (language) {
                if (language != null) {
                  BlocProvider.of<LanguagesCubit>(context)
                      .modifiesLanguage(language);
                }
              },
              items: LanguageList.availableLanguages
                  .map<DropdownMenuItem<Language>>(
                    (language) => DropdownMenuItem(
                      value: language,
                      child: LanguageContainer(language: language),
                    ),
                  )
                  .toList(),
            );
          },
        )
      ],
    );
  }
}
