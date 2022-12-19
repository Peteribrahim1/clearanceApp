import 'package:clearance_app/screens/graduation_status_screen.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                      child: const Icon(Icons.arrow_back)),
                ],
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Student login',
                  style: Styles.headerTextStyle,
                ),
              ),
              const SizedBox(height: 25),

              const Text(
                'Matriculation number ',
                style: Styles.fieldTextStyle,
              ),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.perm_identity,
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  hintText: 'matric number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 10, 38, 1), width: 1),
                  ),
                  hintStyle: Styles.hintTextStyle,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Email ',
                style: Styles.fieldTextStyle,
              ),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 10, 38, 1), width: 1),
                  ),
                  hintStyle: Styles.hintTextStyle,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Password',
                style: Styles.fieldTextStyle,
              ),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.password,
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(20, 10, 38, 1), width: 1),
                  ),
                  hintStyle: Styles.hintTextStyle,
                ),
              ),

              const SizedBox(height: 35),
              Center(
                child: SizedBox(
                  height: 52,
                  width: 280,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GraduationStatusScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                         Colors.deepPurple,),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                            )
                        )
                    ),
                    child: const Text(
                      'Login',
                      style: Styles.buttonTextStyle,
                    ),
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
