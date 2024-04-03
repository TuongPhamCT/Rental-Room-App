import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Views/login_screen.dart';
import 'package:rental_room_app/Views/pincode_screen.dart';
import 'package:rental_room_app/Views/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: 'log_in',
        builder: (context, state) => const LoginScreen(key: Key('log_in')),
        routes: [
          GoRoute(
              path: 'sign_up',
              name: 'sign_up',
              builder: (context, state) =>
                  const SignupScreen(key: Key('sign_up')),
              routes: [
                GoRoute(
                    path: 'pincode/:email',
                    name: 'pincode',
                    builder: (context, state) => PincodeScreen(
                        key: const Key('pincode'),
                        email: state.pathParameters['email']))
              ])
        ]),
  ],
);
