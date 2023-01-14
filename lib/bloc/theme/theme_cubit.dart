import 'package:cobro_app/services/theme/theme_service.dart';
import 'package:cobro_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(
    super.initialState, {
    required this.service,
  });
  ThemeService service;
  void changeColorTheme(ThemeOptions option) async {
    ThemeData data = service.getThemeFromOption(option);
    await service.setThemeDataOnStorage(option);
    emit(data);
  }
}
