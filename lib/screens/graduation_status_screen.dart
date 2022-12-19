import 'package:clearance_app/screens/role_screen.dart';
import 'package:clearance_app/screens/tuition_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/grad_status_dialog.dart';

class GraduationStatusScreen extends StatelessWidget {
  const GraduationStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      appBar: AppBar(
        title: const Text(
          'Graduation Status',
          style: Styles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Graduation Status',
                      textAlign: TextAlign.center,
                      style: Styles.clearedTextStyle,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Peter Smith Jordan',
                      textAlign: TextAlign.center,
                      style: Styles.dashTextStyle,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'UJ/2014/NS/0108',
                      textAlign: TextAlign.center,
                      style: Styles.dashTextStyle,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Cleared',
                      style: Styles.clearedTextStyle,
                    ),
                    const SizedBox(height: 140),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RoleScreen()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Back',
                              style: Styles.buttonTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TuitionScreen()),
                              );
                              // showDialog(
                              //     barrierDismissible: true,
                              //     context: context,
                              //     builder: (BuildContext context) =>
                              //     const GraduationDialog());
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
                              'Proceed',
                              style: Styles.buttonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
