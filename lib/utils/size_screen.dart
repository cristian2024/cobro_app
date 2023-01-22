import 'package:flutter/material.dart';

class SizeScreens {
  /// Design heigh value.
  static const double _designHValue = 760;

  /// Design width value.
  static const double _designWValue = 360;

  static double widthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double heightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Height of notch.
  static double safePaddingTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Padding top based on design value + notch height.
  static double paddingTop(BuildContext context, double value) {
    return safePaddingTop(context) + height(context, value);
  }

  /// Height of device navigation or gesture bar.
  static double safePaddingBottom(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Width value based on design size.
  static double width(BuildContext context, double designValue) {
    return widthScreen(context) * (designValue / _designWValue);
  }

  /// Font size value based on design size.
  static double fontSize(BuildContext context, double designValue) {
    return width(context, designValue);
  }

  /// Icon size value based on design size.
  static double iconSize(BuildContext context, double designValue) {
    return width(context, designValue);
  }

  /// Font size factor value based on design size.
  static double fontHeightFactor(double fontSize, double designValue) {
    return designValue / fontSize;
  }

  /// Height value based on design size.
  static double safeHeight(BuildContext context, double designValue) {
    return ((heightScreen(context) -
            (safePaddingTop(context) + safePaddingBottom(context))) *
        (designValue / _designHValue));
  }

  /// Height value based on design size without safePaddings.
  static double height(BuildContext context, double designValue) {
    return heightScreen(context) * (designValue / _designHValue);
  }
}

/// Class to get size values based on design.
class SizeScreensInstantiable {
  /// Constructor
  SizeScreensInstantiable({
    required this.context,
  }) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    safeBottomPadding = MediaQuery.of(context).padding.bottom;
    safeTopPadding = MediaQuery.of(context).padding.top;
  }

  /// Design heigh value.
  final double _designHValue = 760;

  /// Design width value.
  final double _designWValue = 360;

  late double _width;

  late double _height;

  /// Height of notch.
  late double safeTopPadding;

  /// Height of device navigation or gesture bar.
  late double safeBottomPadding;

  final BuildContext context;

  double widthScreen() {
    return _width;
  }

  double heightScreen() {
    return _height;
  }

  /// Padding top based on design value + notch height.
  double paddingTop(double value) {
    return safeTopPadding + safeHeight(value);
  }

  /// Padding v based on design value + notch height.
  double safeVPadding(double value) {
    return safeHeight(value);
  }

  /// Padding H based on design value + notch height.
  double hPadding(double value) {
    return width(value);
  }

  /// Height of device navigation or gesture bar.
  double safePaddingBottom(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Width value based on design size.
  double width(double designValue) {
    return _width * (designValue / _designWValue);
  }

  /// Font size value based on design size.
  double fontSize(double designValue) {
    return width(designValue);
  }

  /// Icon size value based on design size.
  double iconSize(double designValue) {
    return safeHeight(designValue);
  }

  /// Font size factor value based on design size.
  double fontHeightFactor(double fontSize, double designValue) {
    return (fontSize / designValue);
  }

  /// Height value based on design size.
  double safeHeight(double designValue) {
    return (_height - (safeTopPadding + safeBottomPadding)) *
        (designValue / _designHValue);
  }

  /// Height value based on design size without safePaddings.
  double height(double designValue) {
    return _height * (designValue / _designHValue);
  }
}
