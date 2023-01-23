abstract class Language {
  String get languageName;
  String get countryCode;

  Language();
  Language.fromMap(Map<String, dynamic> map);

  //app basics
  String get appBarTitle1;
  String get settingsTooltipText;

  //signin values
  String get signInTitle;
  String get signInButtonText;
  String get signInOptionsTitle;
  String get signInUsernameLabel;
  String get signInPasswordLabel;

  //others
  String get themeSelectorTitle;
  String get languageSelectorTitle;

  // ===================================================
  //json values into maps
  // ===================================================
  //app basics values
  static String get appBarTitle1Json=>'app_bar_title_1';
  static String get settingsTooltipTextJson => 'settings_tooltip_text';

  //signin values
  static String get signInTitleJson => 'sign_in_title';
  static String get signInButtonTextJson => 'sign_in_button_text';
  static String get signInOptionsTitlejson => 'sign_in_options_title';
  static String get signInUsernameLabeljson => 'sign_in_username_label';
  static String get signInPasswordLabeljson => 'sign_in_password_label';

  //others
  static String get themeSelectorTitleJson => 'theme_selector_title';
  static String get languageSelectorTitleJson => 'language_selector_title';

  @override
  bool operator ==(other) {
    if (other is! Language) {
      return false;
    }

    return '$languageName$countryCode' ==
        '${other.languageName}${other.countryCode}';
  }

  int? _hashCode;
  @override
  int get hashCode {
    _hashCode ??= languageName.hashCode + countryCode.hashCode;
    return _hashCode!;
  }
}
