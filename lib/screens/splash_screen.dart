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
            SizedBox(height: MediaQuery.of(context).size.height * 0.30),
            Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/gradcap.png'),
              ),
            ),
            Text('Online Clearance APP'),
          ],
        ),
      ),
    );
  }
}
