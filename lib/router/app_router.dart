import 'package:go_router/go_router.dart';
import '../pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: HomePage.routeName,
  /* refreshListenable: goRouterNotifier, */
  routes: [
    ///* Primera pantalla
    GoRoute(
      path: HomePage.routeName,
      builder: (_, __) => HomePage(),
    ),
  ],
);
