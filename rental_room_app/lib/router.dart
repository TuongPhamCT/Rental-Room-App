import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Views/login_screen.dart';
import 'package:rental_room_app/Views/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(key: Key('log_in')),
        routes: [
          GoRoute(
              path: 'sign_up',
              builder: (context, state) =>
                  const SignupScreen(key: Key('sign_up')))
        ]),
  ],
);
