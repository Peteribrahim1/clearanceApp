import 'package:clearance_app/screens/role_screen.dart';
import 'package:flutter/material.dart';
import '../styles/styles.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  bool clearValueGrad = false;
  bool unclearValueGrad = true;

  bool clearValueTuition = false;
  bool unclearValueTuition = true;

  bool clearValueDom = false;
  bool unclearValueDom = true;

  bool clearValueLib = false;
  bool unclearValueLib = true;

  bool clearValueLab = false;
  bool unclearValueLab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin only',
          style: Styles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Fill in student\'s record',
                style: Styles.headerTextStyle,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Enter Stundent\'s name ',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                filled: true,
                counterText: "",
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.drive_file_rename_outline,
                ),
                contentPadding: const EdgeInsets.all(18),
                hintText: 'name',
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
              'Enter Stundent\'s Matriculation number ',
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
              'Enter Stundent\'s Email ',
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
              'Create Password',
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
            const SizedBox(height: 15),
            const Text(
              'Graduation Status',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Cleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      clearValueGrad = !clearValueGrad;
                      unclearValueGrad = !unclearValueGrad;
                    });
                  },
                  child: Icon(
                    clearValueGrad? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                const Text('Uncleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      unclearValueGrad = !unclearValueGrad;
                      clearValueGrad = !clearValueGrad;
                    });
                  },
                  child: Icon(
                    unclearValueGrad? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Text(
              'Tuition Fees',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Cleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      clearValueTuition = !clearValueTuition;
                      unclearValueTuition = !unclearValueTuition;
                    });
                  },
                  child: Icon(
                    clearValueTuition? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                const Text('Uncleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      unclearValueTuition = !unclearValueTuition;
                      clearValueTuition = !clearValueTuition;
                    });
                  },
                  child: Icon(
                    unclearValueTuition? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Text(
              'Domitory Fees',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Cleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      clearValueDom = !clearValueDom;
                      unclearValueDom = !unclearValueDom;
                    });
                  },
                  child: Icon(
                    clearValueDom? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                const Text('Uncleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      unclearValueDom = !unclearValueDom;
                      clearValueDom = !clearValueDom;
                    });
                  },
                  child: Icon(
                    unclearValueDom? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Text(
              'Library',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Cleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      clearValueLib = !clearValueLib;
                      unclearValueLib = !unclearValueLib;
                    });
                  },
                  child: Icon(
                    clearValueLib? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                const Text('Uncleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      unclearValueLib = !unclearValueLib;
                      clearValueLib = !clearValueLib;
                    });
                  },
                  child: Icon(
                    unclearValueLib? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            const Text(
              'Laboratory',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Cleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      clearValueLab = !clearValueLab;
                      unclearValueLab = !unclearValueLab;
                    });
                  },
                  child: Icon(
                    clearValueLab? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15),
                const Text('Uncleared'),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      unclearValueLab = !unclearValueLab;
                      clearValueLab = !clearValueLab;
                    });
                  },
                  child: Icon(
                    unclearValueLab? Icons.radio_button_checked : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
              ],
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
                      MaterialPageRoute(builder: (context) => const RoleScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                          ),
                      ),
                  ),
                  child: const Text(
                    'Submit Student Record',
                    style: Styles.buttonTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}
