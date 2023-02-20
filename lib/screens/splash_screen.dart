import 'dart:async';
import 'package:clearance_app/screens/role_screen.dart';
import 'package:flutter/material.dart';

//import '../utils/styles.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, RoleScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.33),
            Center(
              child: Container(
                width: 100,
                height: 100,
                child: Icon(Icons.school, size: 120, color: Colors.deepPurple,),
              ),
            ),
            SizedBox(height: 10),
            Center(child: Text('PLASU clearance', style: TextStyle(fontSize: 20, color: Colors.deepPurple),)),
          ],
        ),
      ),
    );
  }
}
