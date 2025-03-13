import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/Presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const name = "theme_changer";

  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool clickTheme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).state = !clickTheme;
              },
              icon: clickTheme
                  ? Icon(Icons.light_mode_outlined)
                  : Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: _ThemeChangeView(),
    );
  }
}

class _ThemeChangeView extends ConsumerWidget {
  const _ThemeChangeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> coloresDelTema = ref.watch(colorListProvider);
    int indexDelColor = ref.watch(selectedColor);
    return ListView.builder(
      itemCount: coloresDelTema.length,
      itemBuilder: (context, index) {
        final colores = coloresDelTema[index];

        return RadioListTile(
            value: index,
            title: Text(
              "Este Color",
              style: TextStyle(color: colores),
            ),
            // ignore: deprecated_member_use
            subtitle: Text("Color: ${colores.value}"),
            groupValue: indexDelColor,
            activeColor: colores,
            onChanged: (indexDelColor) {
              ref.read(selectedColor.notifier).state = index;
            });
      },
    );
  }
}
