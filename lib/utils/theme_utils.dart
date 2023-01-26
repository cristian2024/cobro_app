import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final familyFont = GoogleFonts.lato();

TextStyle getHeadLine1(ThemeData theme) =>
    (theme.textTheme.headline1 ?? familyFont);

TextStyle getBodyText2(ThemeData theme) =>
    (theme.textTheme.bodyText1 ?? familyFont);

TextStyle getSubtitle1(ThemeData theme) =>
    (theme.textTheme.subtitle1 ?? familyFont);
