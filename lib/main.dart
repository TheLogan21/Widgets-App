import 'package:flutter/material.dart';
import 'package:widgets_app/Presentation/Screens/home/home_screen.dart';
import 'package:widgets_app/config/Theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 5).getTheme(),
        home: const HomeScreen());
  }
}
