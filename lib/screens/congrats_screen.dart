import 'package:clearance_app/screens/role_screen.dart';
import 'package:clearance_app/screens/tuition_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'congrats_screen.dart';

class CongratScreen extends StatelessWidget {
  const CongratScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 350,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      const Text(
                        'Congratulations!',
                        textAlign: TextAlign.center,
                        style: Styles.clearedTextStyle,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'You have successfully completed your clearance. Proceed to the academic unit with your ID card for certificate collection.',
                        textAlign: TextAlign.center,
                        style: Styles.dashTextStyle,
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 48,
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RoleScreen()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurple),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Back to Home',
                            style: Styles.buttonTextStyle,
                          ),
                        ),
                      ),
                    ],
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
