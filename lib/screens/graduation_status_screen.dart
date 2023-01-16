import 'package:clearance_app/screens/role_screen.dart';
import 'package:clearance_app/screens/tuition_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../widgets/grad_status_dialog.dart';

class GraduationStatusScreen extends StatelessWidget {
  const GraduationStatusScreen({Key? key, required this.email}) : super(key: key);

  final String email;

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').where("email", isEqualTo: email).snapshots(),
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
                  height: 400,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Graduation Status',
                          textAlign: TextAlign.center,
                          style: Styles.subTextStyle,
                        ),
                        const SizedBox(height: 10),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Icon(Icons.person, size: 115, color: Colors.grey,),
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
                                       "ID Num: ${snapshot.data!.docs[0]['matricNumber']}",
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
                         Center(child: Text(snapshot.data!.docs[0]["graduationStatus"]?"Qualified! Click proceed to move to the next stage." : "Sorry! You have pending academic issues to clear before you can continue with your clearance. See your coordinator for more details.", style: Styles.clearedTextStyle)),

                        const SizedBox(height: 60),
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
                                  snapshot.data!.docs[0]["graduationStatus"]?  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TuitionScreen(email: email,)),
                                  ) : showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) =>
                                      const GraduationDialog());
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
          );

        },
      ),
    );
  }
}
