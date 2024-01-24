import 'package:clearance_app/screens/congrats_screen.dart';
import 'package:clearance_app/screens/role_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/library_dialog.dart';
import 'lab_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool _isLoading = false;

  bool isLoadingS = false;

  Future<void> simulateNetworkRequest() async {
    // Simulate a network request or any other time-consuming task.
    await Future.delayed(
        const Duration(seconds: 2)); // Simulate a 2-second delay.
  }

  void logOut() async {
    setState(() {
      _isLoading = true;
    });
    FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const RoleScreen(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('You are logged out!'),
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      appBar: AppBar(
        title: const Text(
          'University Library Status',
          style: Styles.appBarTextStyle,
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              logOut();
            },
            child: const Icon(
              Icons.logout,
              color: Colors.red,
            )),
        backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where("email", isEqualTo: widget.email)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 420,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          'Library Status',
                          textAlign: TextAlign.center,
                          style: Styles.subTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 115,
                              color: Colors.grey,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "Name: ${snapshot.data!.docs[0]['name']}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.dashboardTextStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  FittedBox(
                                    child: Text(
                                      "ID Num: ${snapshot.data!.docs[0]['password']}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.dashboardTextStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  FittedBox(
                                    child: Text(
                                      "Faculty: ${snapshot.data!.docs[0]['faculty']}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.dashboardTextStyle,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  FittedBox(
                                    child: Text(
                                      "Dept: ${snapshot.data!.docs[0]['department']}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.dashboardTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Center(
                            child: Text(
                                snapshot.data!.docs[0]["library"]
                                    ? "Cleared! click proceed to move to the next stage."
                                    : "Sorry! You have not fulfilled the requirements to clear with the library yet. Kindly go to the library for more details",
                                style: Styles.clearedTextStyle)),
                        const SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 48,
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 106, 78, 1)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
                                onPressed: () async {
                                  setState(() {
                                    isLoadingS = true;
                                  });

                                  await simulateNetworkRequest();

                                  setState(() {
                                    isLoadingS = false;
                                  });

                                  if (snapshot.data!.docs[0]["library"] ==
                                          true &&
                                      snapshot.data!.docs[0]["faculty"] ==
                                          'Sciences') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LabScreen(
                                                email: widget.email,
                                              )),
                                    );
                                  } else if (snapshot.data!.docs[0]
                                              ["library"] ==
                                          true &&
                                      snapshot.data!.docs[0]["faculty"] !=
                                          'Science') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CongratScreen()),
                                    );
                                  } else {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const LibraryDialog());
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 106, 78, 1)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: isLoadingS
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
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
          );
        },
      ),
    );
  }
}
