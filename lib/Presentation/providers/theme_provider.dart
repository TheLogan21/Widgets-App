import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/Theme/app_theme.dart';

final themeProvider = StateProvider(
  (ref) => true,
);

// Listado de Colores

final colorListProvider = Provider((ref) => coloresTemas);

//un simple entero

final selectedColor = StateProvider((ref) => 0);
