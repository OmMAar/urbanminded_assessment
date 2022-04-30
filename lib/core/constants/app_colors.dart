import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const primaryColor = Color(0xff00003D);
  static const secondaryColor = Color(0xff4D4D77);
  static const secondaryColor2 = Color(0xffFF9D45);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color bluePure = Colors.blue;
  static const Color blue = Color(0xFF008CF0);
  static const Color red = Colors.red;
  static const Color darkGrey = Color(0xff857F82);
  static const Color lightGrey = Color(0xffCCCCD8);
  static const Color activeTab = Color(0xffEAEAF3);

  /// background colors
  static const Color scaffoldBGColor2 = Color(0xffE5E5E5);
  static const Color scaffoldBGColor1 = Color(0xffF6F8FB);
  static const Color darkSplashBGColor1 = Color(0xff1A1A50);

  static const Color gradientIndicator1 = Color(0xff95DDFF);
  static const Color gradientIndicator2 = Color(0xff2C73FF);

  static const Color green = Color(0xff4CB488);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
