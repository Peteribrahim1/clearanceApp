import 'package:clearance_app/screens/role_screen.dart';
import 'package:clearance_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online clearance',
      initialRoute: '/',
      routes: {
        '/': (ctx) => RoleScreen(),
        // RoleScreen.routeName: (ctx) => RoleScreen(),
      },
    );
  }
}