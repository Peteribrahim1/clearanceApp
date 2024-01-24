import 'package:clearance_app/screens/clearance_list_screen.dart';
import 'package:clearance_app/screens/role_screen.dart';
import 'package:clearance_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (ctx) => SplashScreen(),
        RoleScreen.routeName: (ctx) => RoleScreen(),
      },
      //  home: ClearanceList(),
    );
  }
}
