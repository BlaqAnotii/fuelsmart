import 'package:flutter_template/views/home/home.dart';
import 'package:go_router/go_router.dart';
import '../views/startup/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (context, GoRouterState state) {
            return HomeScreen();
          },
        ),
      ],
    ),
  ],
);
