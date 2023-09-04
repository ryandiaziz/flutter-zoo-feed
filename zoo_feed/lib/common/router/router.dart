import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoo_feed/features/page_controller.dart';

import '../../features/auth/pages/login.dart';
import '../../features/auth/pages/register.dart';
import '../../features/welcome/pages/splash_page.dart';

export 'package:go_router/go_router.dart';
part 'routes_name.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: Routes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: Routes.login,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      name: Routes.register,
      builder: (BuildContext context, GoRouterState state) {
        return RegisterPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
  ],
);
