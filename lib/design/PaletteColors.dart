import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaletteColors {
  static MaterialColor primary = generateMaterialColor('#F2B441');
  static MaterialColor secondary = generateMaterialColor('#F2DA63');
  static MaterialColor background = generateMaterialColor('#F2F2F2');

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return Color(int.parse("0x$hexColor"));
  }

  static MaterialColor generateMaterialColor(String hexColor) {
    var color = getColorFromHex(hexColor);
    return MaterialColor(color.value, generateSwatchColors(color));
  }

  static generateSwatchColors(Color color) {
    return {
      50: color.withOpacity(.1),
      100: color.withOpacity(.2),
      200: color.withOpacity(.3),
      300: color.withOpacity(.4),
      400: color.withOpacity(.5),
      500: color.withOpacity(.6),
      600: color.withOpacity(.7),
      700: color.withOpacity(.8),
      800: color.withOpacity(.9),
      900: color.withOpacity(1),
    };
  }
}
