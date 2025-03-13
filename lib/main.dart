import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/Presentation/providers/theme_provider.dart';
import 'package:widgets_app/config/Theme/app_theme.dart';
import 'package:widgets_app/config/routers/router_path_config.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int colorSeleccionado = ref.watch(selectedColor);
    final bool darkMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: "Flutter Widgets",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: colorSeleccionado, isDarkMode: darkMode)
          .getTheme(),
    );
  }
}
