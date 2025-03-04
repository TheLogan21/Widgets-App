import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBars"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Mostrar Snackbar"),
        icon: Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}
