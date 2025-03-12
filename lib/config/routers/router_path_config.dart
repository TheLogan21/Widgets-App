import 'package:go_router/go_router.dart';
import 'package:widgets_app/Presentation/Screens/screens.dart';


final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    name: HomeScreen.name,
    path: "/",
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    name: ButtonsScreen.name,
    path: "/buttons",
    builder: (context, state) => ButtonsScreen(),
  ),
  GoRoute(
    name: CardsScreen.name,
    path: "/cards",
    builder: (context, state) => CardsScreen(),
  ),
  GoRoute(
    name: ProgressScreen.name,
    path: "/progress",
    builder: (context, state) => ProgressScreen(),
  ),
  GoRoute(
    name: SnackBarScreen.name,
    path: "/snackbar",
    builder: (context, state) => SnackBarScreen(),
  ),
  GoRoute(
    name: AnimatedScreen.name,
    path: "/animated",
    builder: (context, state) => AnimatedScreen(),
  ),
  GoRoute(
    name: UiControllsScreen.name,
    path: "/ui_controlls",
    builder: (context, state) => UiControllsScreen(),
  ),
  GoRoute(
    name: AppTutotrialScreen.name,
    path: "/app_tutorial",
    builder: (context, state) => AppTutotrialScreen(),
  ),
  GoRoute(
    name: InfiniteScrollScreen.name,
    path: "/infinite_scroll",
    builder: (context, state) => InfiniteScrollScreen(),
  ),
  GoRoute(
    name: CounterScreen.name,
    path: "/counter_screen",
    builder: (context, state) => CounterScreen(),
  ),
  GoRoute(
    name: ThemeChanger.name,
    path: "/theme_changer",
    builder: (context, state) => ThemeChanger(),
  ),
]);
