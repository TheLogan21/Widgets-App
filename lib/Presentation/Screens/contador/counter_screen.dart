import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/Presentation/providers/counter_provider.dart';
import 'package:widgets_app/Presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static const name = "counter_screen";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    bool clickTheme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
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
      body: Center(
          child: Text("Varlor: $clickCounter",
              style: Theme.of(context).textTheme.titleLarge)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.plus_one_outlined),
      ),
    );
  }
}
