

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Theme_BackGround {
  static SharedPreferences? _prefs;

  static const _keyColor = 'color';

  static Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Color getColor() {
    String colorName = _prefs?.getString(_keyColor) ?? 'white'; // Default color
    return colorName == 'black' ? Color.fromARGB(255, 58, 58, 58) : Color.fromARGB(255, 255, 255, 255);
  }

  static Future setColor(String colorName) async {
    await _prefs?.setString(_keyColor, colorName);
  }
}


class Theme_Text {
  static SharedPreferences? _prefs;

  static const _keyColor = 'color';

  static Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Color getColor() {
    String colorName = _prefs?.getString(_keyColor) ?? 'white'; // Default color
    return colorName == 'black' ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 0, 0, 0);
  }

  static Future setColor(String colorName) async {
    await _prefs?.setString(_keyColor, colorName);
  }
}
