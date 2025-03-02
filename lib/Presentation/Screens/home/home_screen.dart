import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/Presentation/Screens/cards/cards_screen.dart';

import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material"),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuDeItems = appMenuItems[index];
        return _CustomListTile(menuDeItems: menuDeItems);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuDeItems,
  });

  final MenuItems menuDeItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        menuDeItems.icono,
        color: colors.primary,
      ),
      title: Text(menuDeItems.title),
      subtitle: Text(menuDeItems.subtitle),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        color: colors.primary,
      ),
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(
        //builder: (context) => const ButtonsScreen(),
        //));
        // Navigator.pushNamed(
        // context,
        //menuDeItems.link,
        //);
        context.push(menuDeItems.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
