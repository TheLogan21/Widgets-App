import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/Theme/app_theme.dart';

final themeProvider = StateProvider(
  (ref) => true,
);

// Listado de Colores inmutables

final colorListProvider = Provider((ref) => coloresTemas);

//un simple entero

final selectedColor = StateProvider((ref) => 0);

//objeto de tipo AppTheme

final themeNotifierPorvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //EL STATE O ESTADO ES BASICAMENTE UNA NUEVA ESTANCIA DE APPTHEME
  ThemeNotifier() : super(AppTheme());
}
