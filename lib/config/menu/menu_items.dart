import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icono;

  const MenuItems(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icono});
}

const List<MenuItems> appMenuItems = [
  MenuItems(
      icono: Icons.smart_button_rounded,
      link: "/buttons",
      title: "Botones",
      subtitle: "Varios Botones de Flutter"),
  MenuItems(
      icono: Icons.credit_card,
      link: "/cards",
      title: "Tarjetas",
      subtitle: "Contenedor Estilizado"),
  MenuItems(
      icono: Icons.refresh_rounded,
      link: "/progress",
      title: "Progress Indicator",
      subtitle: "Generales y Controlades"),
  MenuItems(
      icono: Icons.info_outline_rounded,
      link: "/snackbar",
      title: "SnackBars y Dialogos",
      subtitle: "Indicadores en pantalla"),
];
