import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = "animated_screen";
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50.0;
  double hight = 50.0;
  Color colorInicial = Colors.indigo;
  double borderRadiusInicial = 10.0;

  void changeShape() {
    final rand = Random();
    width = rand.nextInt(300) + 20;
    hight = rand.nextInt(420) + 20;
    borderRadiusInicial = rand.nextInt(100) + 7;
    colorInicial = Color.fromRGBO(
        rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animaciones"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceOut,
          width: width,
          height: hight,
          decoration: BoxDecoration(
              color: colorInicial,
              borderRadius: BorderRadius.circular(borderRadiusInicial)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.animation_outlined),
      ),
    );
  }
}
