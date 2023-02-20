import 'package:clearance_app/screens/graduation_status_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../styles/styles.dart';
import '../utils/utils.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }


  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
      //dbMatric: dbMatric,
    );

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => GraduationStatusScreen(email: _emailController.text),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

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
                'Student Email ',
                style: Styles.fieldTextStyle,
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _emailController,
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
                'Matric Number',
                style: Styles.fieldTextStyle,
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.drive_file_rename_outline_outlined,
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  hintText: 'mat number',
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
                    onPressed: loginUser,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurple,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
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
