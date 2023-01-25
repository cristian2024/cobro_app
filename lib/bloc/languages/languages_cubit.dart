import 'dart:math';

import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/languages/language_EN_US.dart';
import 'package:cobro_app/services/languages/language_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesCubit extends Cubit<Language> {
  LanguagesCubit({
    required this.service,
  }) : super(LanguageEnUs());
  final LanguageService service;

  void modifiesLanguage(Language language) {
    service.setLanguageInStorage(language);
    emit(language);
  }

  void loadLanguage() async {
    final language = await service.getLanguageFromStorage();
    emit(language);
  }
}
