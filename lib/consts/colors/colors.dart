// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ConstColors {
  // brand color is the primary color of the app

  static const _brand = 0xff5D4037;
  static const MaterialColor Brand = MaterialColor(
    _brand,
    <int, Color>{
      50: Color(0xffEFEBE9),
      100: Color(0xffD7CCC8),
      200: Color(0xffBCAAA4),
      300: Color(0xffA1887F),
      400: Color(0xff8D6E63),
      500: Color(0xff795548),
      600: Color(0xff6D4C41),
      700: Color(_brand),
      800: Color(0xff4E342E),
      900: Color(0xff3E2723),
    },
  );

  // secondary color is the second color of theme
  static const _secondary = 0xff37545D;
  static const MaterialColor Secondary = MaterialColor(
    _secondary,
    <int, Color>{
      50: Color(0xffE6EFF3),
      100: Color(0xffC7D6DB),
      200: Color(0xffA6BBC1),
      300: Color(0xff839FA8),
      400: Color(0xff6A8A95),
      500: Color(0xff507783),
      600: Color(0xff456872),
      700: Color(_secondary),
      800: Color(0xff2A4149),
      900: Color(0xff1A2C32),
    },
  );

  // semantic colors

  static const Color SemanticSucces = Color(0xff43936C);
  static const Color SemanticInfo = Color(0xff03539E);
  static const Color SemanticDanger = Color(0xffE33131);
  static const Color SemanticWarning = Color(0xffEB9525);

  // neutral colors

  static const Color NeutralLight = Color(0xffFEFEFE);
  static const Color NeutralMedium = Color(0xffF0F0F0);
  static const Color NeutralDark = Color(0xff3C3C3C);

  // text colors

  static const Color TextHeading = Color(0xff3C3C3C);
  static const Color TextParagraph = Color(0xff555555);
  static const Color TextNonActive = Color(0xff868686);
  static const Color TextDisabled = Color(0xffCACACA);
}
