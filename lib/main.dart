import 'package:flutter/material.dart';
import 'package:widgets_app/config/Theme/app_theme.dart';
import 'package:widgets_app/config/routers/router_path_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 5).getTheme(),
    );
  }
}
