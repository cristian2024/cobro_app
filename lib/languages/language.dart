abstract class Language {
  String get languageName;
  String get countryCode;

  Language();
  Language.fromMap(Map<String, dynamic> map) {
    //app basics
    appBarTitle1 = map[Language.appBarTitle1Json] ?? 'Cobro app';
    settingsTooltipText =
        map[Language.settingsTooltipTextJson] ?? 'App settings';

    signInTitle = map[Language.signInTitleJson] ?? 'Sign in';
    signInOptionsTitle = map[Language.signInOptionsTitlejson] ?? 'Or use';
    signInButtonText = map[Language.signInButtonTextJson] ?? 'Sign in';
    signInPasswordLabel = map[Language.signInPasswordLabeljson] ?? 'Password';
    signInUsernameLabel =
        map[Language.signInUsernameLabeljson] ?? 'Username/email';

    //others
    themeSelectorTitle =
        map[Language.themeSelectorTitleJson] ?? 'Theme selector';
    languageSelectorTitle =
        map[Language.languageSelectorTitleJson] ?? 'Language selector';
  }

  //app basics
  late String appBarTitle1;
  late String settingsTooltipText;

  //signin values
  late String signInTitle;
  late String signInButtonText;
  late String signInOptionsTitle;
  late String signInUsernameLabel;
  late String signInPasswordLabel;

  //others
  late String themeSelectorTitle;
  late String languageSelectorTitle;

  // ===================================================
  //json values into maps
  // ===================================================
  //app basics values
  static String get appBarTitle1Json => 'app_bar_title_1';
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
