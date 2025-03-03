import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Buttons Screen"),
        ),
        body: const _ButtonsViews(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.keyboard_double_arrow_left_sharp),
        ));
  }
}

class _ButtonsViews extends StatelessWidget {
  const _ButtonsViews();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(
                onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("Elevated Icon"),
            ),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(
              onPressed: () {},
              label: const Text("Filled Icon"),
              icon: const Icon(Icons.fastfood_outlined),
            ),
            OutlinedButton(onPressed: () {}, child: const Text("Outline")),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text("Outline Icon"),
              icon: const Icon(Icons.insert_comment_outlined),
            ),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
              onPressed: () {},
              label: const Text("Text Icon"),
              icon: const Icon(Icons.access_time_rounded),
            ),
            const ChevereButton(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code_outlined),
              style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(color.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChevereButton extends StatelessWidget {
  const ChevereButton({super.key});

  @override
  Widget build(BuildContext context) {
    final coloresDeEscena = Theme.of(context).colorScheme;

    return Material(
      color: coloresDeEscena.primary,
      borderRadius: BorderRadius.circular(15),
      elevation: 3,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Hola boton",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
