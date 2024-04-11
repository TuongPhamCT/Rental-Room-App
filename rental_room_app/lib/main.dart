import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rental_room_app/config/firebase_options.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initiate firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Like House',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
