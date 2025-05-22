import 'package:go_router/go_router.dart';
import 'package:mobile_app/screens/home/home.dart';
import 'package:mobile_app/screens/route_data/route_data_screen.dart';

class AppRouter {
  static const home = 'home';
  static const routeData = 'routeData';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: home,
        builder: (ctx, state) => Home(),
        routes: [
          GoRoute(
            path: routeData,
            name: routeData,
            builder: (ctx, state) => RouteDataScreen(),
          ),
        ],
      ),
    ],
  );
}
