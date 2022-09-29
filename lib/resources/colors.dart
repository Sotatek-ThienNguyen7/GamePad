import 'dart:ui';

class AppColor {
  static Color primary = HexColor("#258EF8");
  static Color violet = HexColor("#8652B0");
  static Color violet2 = HexColor("#462C62");
  static Color violet3 = HexColor("#282433");
  static Color violet4 = HexColor("#413C54");
  static Color violet5 = HexColor("#080217");
  static Color black1 = HexColor("#080217");
  static Color grey1 = HexColor("#5A5A5A");
  static Color grey2 = HexColor("#8C8C8C");
  static Color greenLight = HexColor("#00FBB7");
  static Color green2 = HexColor("#01F9B6");
  static Color green = HexColor("#14FF00");
  static Color  red = HexColor("#EE1D52");
  static Color background = HexColor("#1D1A24");
  static Color white = HexColor("#FFFFFF");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}