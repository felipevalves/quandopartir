import 'dart:ui';
import 'hex_color.dart';

class MyColor{

  static const String _primaryColor = '1B2A3B';
  static const String _primaryColorDark = 'e8e8e8';
  static const String _accentColor = '9B72FB';

  static const String facebookBlue = '3B5998';

  static const String gray = '303030';



  static Color primaryColor() {
    return HexColor(_primaryColor);
  }

  static Color primaryColorDark() {
    return HexColor(_primaryColorDark);
  }

  static Color accentColor() {
    return HexColor(_accentColor);
  }

  static Color color(String hex) {
    return HexColor(hex);
  }

}