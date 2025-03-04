import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snackBar_screen";

  const SnackBarScreen({super.key});
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text("Hola Mundito"),
      action: SnackBarAction(
        label: "Oki!",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialogo(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Estas seguro?"),
        content: const Text(
            "Eiusmod ut sit eu ullamco cillum qui sit quis. Consequat commodo sint in consectetur laboris velit Lorem veniam tempor excepteur mollit. Consectetur non esse aliquip ad mollit nisi dolor dolor laboris velit veniam dolor qui esse."),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text("Cancelar")),
          FilledButton(
              onPressed: () => context.pop(), child: const Text("Aceptar")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBars"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        "Enim in adipisicing nostrud duis aliquip consectetur proident excepteur. Veniam in consectetur ex tempor laborum sit et est quis. Nulla enim sit nisi est occaecat veniam enim occaecat in veniam amet.")
                  ]);
                },
                child: Text("Licencias Usadas")),
            SizedBox(
              height: 10,
            ),
            FilledButton.tonal(
                onPressed: () {
                  openDialogo(context);
                },
                child: Text("Mostar Dialogo de pantalla"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Mostrar Snackbar"),
        icon: Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}
