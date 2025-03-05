import 'package:flutter/material.dart';

class UiControllsScreen extends StatelessWidget {
  static const name = "ui_controlls_screen";

  const UiControllsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ui Controlls"),
      ),
      body: _UIControllsView(),
    );
  }
}

class _UIControllsView extends StatefulWidget {
  const _UIControllsView();

  @override
  State<_UIControllsView> createState() => _UIControllsViewState();
}

enum Transportarion { car, plane, boat, submarine }

class _UIControllsViewState extends State<_UIControllsView> {
  bool isDeveloper = true;
  Transportarion selectedTransportation = Transportarion.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text("Developer Mode"),
            subtitle: const Text("Controles Adicionales"),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          initiallyExpanded: true,
          title: const Text("Vehiculo de Transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              subtitle: const Text("Viajar por Carro"),
              title: const Text("By Car"),
              value: Transportarion.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportarion.car;
              }),
            ),
            RadioListTile(
              subtitle: const Text("Viajar por Avión"),
              title: const Text("By Plane"),
              value: Transportarion.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportarion.plane;
              }),
            ),
            RadioListTile(
              subtitle: const Text("Viajar por Bote"),
              title: const Text("By Boat"),
              value: Transportarion.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportarion.boat;
              }),
            ),
            RadioListTile(
              subtitle: const Text("Viajar por Submarino"),
              title: const Text("By Subamerine"),
              value: Transportarion.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportarion.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
            title: const Text("¿Desea desayuno?"),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text("¿Desea Almuerzo?"),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text("¿Desea Cena?"),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
