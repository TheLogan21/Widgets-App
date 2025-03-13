import 'package:flutter/material.dart';

const List<Color> coloresTemas = [
  Colors.blue,
  Colors.red,
  Colors.deepPurple,
  Colors.yellow,
  Colors.brown,
  Colors.deepOrange,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, "Selected Color must be grater than 0"),
        assert(selectedColor < coloresTemas.length,
            "Selected Color must be less or equal to ${coloresTemas.length - 1} ");

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.light : Brightness.dark,
      colorSchemeSeed: coloresTemas[selectedColor],
      appBarTheme: AppBarTheme(centerTitle: true));
}
