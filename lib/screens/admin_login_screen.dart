import 'package:clearance_app/screens/admin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
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
                  'Admin Panel',
                  style: Styles.headerTextStyle,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Admin Access code',
                style: Styles.fieldTextStyle,
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.password,
                  ),
                  contentPadding: const EdgeInsets.all(18),
                  hintText: 'admin pass code',
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
                      if (_passwordController.text.isNotEmpty) {
                        if (_passwordController.text == '1234') {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AdminScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.black,
                              content: Text('Incorrect admin access code!'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.black,
                            content: Text('Please enter the access code!'),
                          ),
                        );
                      }
                    },
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
