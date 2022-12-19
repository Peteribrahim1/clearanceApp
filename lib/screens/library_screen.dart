import 'package:clearance_app/screens/tuition_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import 'lab_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 10, 38, 1),
      appBar: AppBar(
        title: const Text(
          'University Library Status',
          style: Styles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
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
                      'Library fees status',
                      textAlign: TextAlign.center,
                      style: Styles.clearedTextStyle,
                    ),
                    SizedBox(height: 10),
                    const Text(
                      'Peter Smith Jordan',
                      textAlign: TextAlign.center,
                      style: Styles.dashTextStyle,
                    ),
                    SizedBox(height: 5),
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
                    SizedBox(height: 140),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
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
                                MaterialPageRoute(builder: (context) => const LabScreen()),
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
