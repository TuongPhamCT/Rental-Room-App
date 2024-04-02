import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Views/login_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) => const Loginscreen(key: Key('log_in')),
        routes: [
          GoRoute(
              path: 'log_in',
              builder: (context, state) => const Loginscreen(key: Key('log')))
        ]),
  ],
);
