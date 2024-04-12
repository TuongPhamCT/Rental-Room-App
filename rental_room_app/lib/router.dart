import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_room_app/Views/all_room_screen.dart';
import 'package:rental_room_app/Views/bottom_bar.dart';
import 'package:rental_room_app/Views/login_screen.dart';
import 'package:rental_room_app/Views/pincode_screen.dart';
import 'package:rental_room_app/Views/register_form_screen.dart';
import 'package:rental_room_app/Views/report_screen.dart';
import 'package:rental_room_app/Views/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (BuildContext context, GoRouterState state) {
        if (FirebaseAuth.instance.currentUser != null) {
          return '/home';
        } else {
          return '/log_in';
        }
      },
    ),
    GoRoute(
        path: '/log_in',
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
                        email: state.pathParameters['email']),
                    routes: [
                      GoRoute(
                        path: 'register_form',
                        name: 'register_form',
                        builder: (context, state) => RegisterFormScreen(
                            key: const Key('register_form'),
                            email: state.pathParameters['email']),
                      )
                    ])
              ]),
        ]),
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const BottomBar(key: Key('home')),
        routes: [
          GoRoute(
            path: 'all_room',
            name: 'all_room',
            builder: (context, state) => const AllRoom(key: Key('all_room')),
          ),
          GoRoute(
            path: 'report',
            name: 'report',
            builder: (context, state) => const ReportScreen(key: Key('report')),
          ),
        ]),
  ],
);
