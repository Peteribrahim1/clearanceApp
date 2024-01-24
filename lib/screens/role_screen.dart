import 'package:clearance_app/screens/student_login_screen.dart';
import 'package:clearance_app/styles/styles.dart';
import 'package:flutter/material.dart';

import 'admin_login_screen.dart';

class RoleScreen extends StatelessWidget {
  static const routeName = '/role';

  const RoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 74),
              const Center(
                child: Text(
                  'Hi dear! Welcome to',
                  style: Styles.normalTextStyle,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'GSU clearance App',
                style: Styles.bigTextStyle,
              ),
              const SizedBox(height: 170),
              const Text(
                'Are you an?',
                style: Styles.normalTextStyle,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 52,
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminLoginScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(0, 106, 78, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Admin',
                    style: Styles.buttonTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'or',
                style: Styles.normalTextStyle,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 52,
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentLoginScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(0, 106, 78, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Graduating Student',
                    style: Styles.buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
