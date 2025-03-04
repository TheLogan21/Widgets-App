import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Indicator"),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text("Circular Porgress Indicator"),
          const SizedBox(
            height: 12,
          ),
          CircularProgressIndicator(
              strokeWidth: 2, backgroundColor: Colors.black12),
          const SizedBox(
            height: 20,
          ),
          const Text("Circular and Linear Controlado"),
          const SizedBox(
            height: 12,
          ),
          _ControllerPorgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerPorgressIndicator extends StatelessWidget {
  const _ControllerPorgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 50),
        (value) {
          return (value * 2) / 100;
        },
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue,
              ))
            ],
          ),
        );
      },
    );
  }
}
