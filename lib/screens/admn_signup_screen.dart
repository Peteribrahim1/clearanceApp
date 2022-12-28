// import 'package:clearance_app/screens/graduation_status_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../resources/auth_methods.dart';
// import '../styles/styles.dart';
// import '../utils/utils.dart';
// import 'admin_login_screen.dart';
//
// class AdminSignUpScreen extends StatefulWidget {
//   const AdminSignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
// }
//
// class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   bool _isLoading = false;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }
//
//   void signUpAdmin() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String res = await AuthMethods().signUpAdmin(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//
//     setState(() {
//       _isLoading = false;
//     });
//
//     if (res != 'success') {
//       showSnackBar(res, context);
//     } else {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => const AdminLoginScreen(),
//         ),
//       );
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Colors.black,
//           content: Text('Admin account created successfully!'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Icon(Icons.arrow_back)),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               const Center(
//                 child: Text(
//                   'Admin Signup',
//                   style: Styles.headerTextStyle,
//                 ),
//               ),
//               const SizedBox(height: 25),
//               const Text(
//                 'Email ',
//                 style: Styles.fieldTextStyle,
//               ),
//               const SizedBox(height: 5),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.email,
//                   ),
//                   contentPadding: const EdgeInsets.all(18),
//                   hintText: 'email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(
//                         color: Color.fromRGBO(20, 10, 38, 1), width: 1),
//                   ),
//                   hintStyle: Styles.hintTextStyle,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               const Text(
//                 'Password',
//                 style: Styles.fieldTextStyle,
//               ),
//               const SizedBox(height: 5),
//               TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.password,
//                   ),
//                   contentPadding: const EdgeInsets.all(18),
//                   hintText: 'password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(
//                         color: Color.fromRGBO(20, 10, 38, 1), width: 1),
//                   ),
//                   hintStyle: Styles.hintTextStyle,
//                 ),
//               ),
//               const SizedBox(height: 35),
//               Center(
//                 child: SizedBox(
//                   height: 52,
//                   width: 280,
//                   child: ElevatedButton(
//                     onPressed: signUpAdmin,
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                           Colors.deepPurple,
//                         ),
//                         shape:
//                         MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ))),
//                     child: _isLoading
//                         ? const Center(
//                       child: CupertinoActivityIndicator(
//                         color: Colors.white,
//                       ),
//                     )
//                         : const Text(
//                       'SignUp',
//                       style: Styles.buttonTextStyle,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
