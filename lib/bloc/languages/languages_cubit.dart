
import 'package:cobro_app/languages/language.dart';
import 'package:cobro_app/languages/language_EN_US.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesCubit extends Cubit<Language> {
  LanguagesCubit() : super(LanguageEnUs());
}
