import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final titleStile = Theme.of(context).textTheme.titleMedium;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final appLinks = appMenuItems[value];
        context.push(appLinks.link);
      },
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Text(
            "Main Options",
            style: titleStile,
          ),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icono),
                label: Text(item.title),
              ),
            ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: colores.primary,
            indent: 20,
            thickness: 1.75,
            endIndent: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            "More Options",
            style: titleStile,
          ),
        ),
        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icono),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
