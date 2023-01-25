import 'package:flutter/material.dart';

TextStyle getHeadLine1(ThemeData theme) =>
    (theme.textTheme.headline1 ?? const TextStyle());

TextStyle getBodyText2(ThemeData theme) =>
    (theme.textTheme.bodyText1 ?? const TextStyle());
