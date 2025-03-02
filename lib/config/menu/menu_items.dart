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
      link: "/card",
      title: "Tarjetas",
      subtitle: "Contenedor Estilizado"),
];
