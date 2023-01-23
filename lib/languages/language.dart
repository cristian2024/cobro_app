abstract class Language {
   String get languageName;
   String get countryCode;

  Language();
  Language.fromMap(Map<String, dynamic> map);
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
  //signin values
  static String get signInTitleJson => 'sign_in_title';
  static String get signInButtonTextJson => 'sign_in_button_text';
  static String get signInOptionsTitlejson => 'sign_in_options_title';
  static String get signInUsernameLabeljson => 'sign_in_username_label';
  static String get signInPasswordLabeljson => 'sign_in_password_label';

  //others
  static String get themeSelectorTitleJson => 'theme_selector_title';
  static String get languageSelectorTitleJson => 'language_selector_title';
}
