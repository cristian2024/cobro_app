abstract class Language {
  String get languageName;
  String get countryCode;

  Language();
  Language.fromMap(Map<String, dynamic> map) {
    //app basics
    appBarTitle1 = map[Language.appBarTitle1Json] ?? 'Cobro app';
    settingsTooltipText =
        map[Language.settingsTooltipTextJson] ?? 'App settings';

    //authentication
    authPasswordLabel = map[Language.signInPasswordLabelJson] ?? 'Password';
    authEmailLabel = map[Language.authEmailLabelJson] ?? authEmailLabel;
    authAlreadyUser = map[Language.authAlreadyUserJson] ?? authAlreadyUser;

    //signin options
    signInTitle = map[Language.signInTitleJson] ?? 'Sign in';
    authOptionsTitle = map[Language.authOptionsTitleJson] ?? 'Or use';
    signInButtonText = map[Language.signInButtonTextJson] ?? 'Sign in';

    //signup options
    signUpTitle = map[Language.signUpTitleJson] ?? 'Sign up';
    signUpButtonText = map[Language.signUpButtonTextJson] ?? signInButtonText;

    //others
    themeSelectorTitle =
        map[Language.themeSelectorTitleJson] ?? 'Theme selector';
    languageSelectorTitle =
        map[Language.languageSelectorTitleJson] ?? 'Language selector';
  }

  //app basics
  String appBarTitle1 = 'Cobro app';
  String settingsTooltipText = 'App settings';

  //authentication
  String authEmailLabel = 'Email';
  String authPasswordLabel = 'Password';
  String authAlreadyUser = 'Already a user?';
  String authNeedAccount = 'Need an account?';
  String authOptionsTitle = 'Or use';

  //signin values
  String signInTitle = 'Sign in';
  String signInButtonText = 'Sign in';

  //signup values
  String signUpTitle = 'Sign up';
  String signUpButtonText = 'Sign up';

  //others
  String themeSelectorTitle = 'Theme selector';
  String languageSelectorTitle = 'Language selector';

  // ===================================================
  //json values into maps
  // ===================================================
  //app basics values
  static String get appBarTitle1Json => 'app_bar_title_1';
  static String get settingsTooltipTextJson => 'settings_tooltip_text';

  //authentication values
  static String get authEmailLabelJson => 'auth_username_label';
  static String get signInPasswordLabelJson => 'auth_password_label';
  static String get authAlreadyUserJson => 'auth_already_user';
  static String get authNeedAccountJson => 'auth_need_account';
  static String get authOptionsTitleJson => 'auth_options_title';

  //signin values
  static String get signInTitleJson => 'sign_in_title';
  static String get signInButtonTextJson => 'sign_in_button_text';

  //signup values
  static String get signUpTitleJson => 'sign_up_title';
  static String get signUpButtonTextJson => 'sign_up_button_text';

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
