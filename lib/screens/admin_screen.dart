import 'package:clearance_app/screens/role_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../resources/auth_methods.dart';
import '../styles/styles.dart';
import '../utils/utils.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<dynamic> faculties = [];
  List<dynamic> departmentsMasters = [];
  List<dynamic> departments = [];

  String? facultyId;
  String? departmentId;
  String? selectedDept;
  String? selectedFaculty;

  @override
  void initState() {
    super.initState();
    this.faculties.add({"id": 1, "name": "Science"});
    this.faculties.add({"id": 2, "name": "Art"});
    this.faculties.add({"id": 3, "name": "Management"});
    this.faculties.add({"id": 4, "name": "Environmental"});

    this.departmentsMasters = [
      {"ID": 1, "Name": "Microbiology", "ParentId": 1},
      {"ID": 2, "Name": "Computer Science", "ParentId": 1},
      {"ID": 3, "Name": "Chemistry ", "ParentId": 1},
      {"ID": 4, "Name": "Physics", "ParentId": 1},
      {"ID": 1, "Name": "History", "ParentId": 2},
      {"ID": 2, "Name": "Political Science", "ParentId": 2},
      {"ID": 3, "Name": "Sociology", "ParentId": 2},
      {"ID": 4, "Name": "Music", "ParentId": 2},
      {"ID": 1, "Name": "Accounting", "ParentId": 3},
      {"ID": 2, "Name": "Business Admin", "ParentId": 3},
      {"ID": 3, "Name": "Banking & finance", "ParentId": 3},
      {"ID": 4, "Name": "Economics", "ParentId": 3},
      {"ID": 1, "Name": "Architecture", "ParentId": 4},
      {"ID": 2, "Name": "Building", "ParentId": 4},
      {"ID": 3, "Name": "Qty survey", "ParentId": 4},
      {"ID": 4, "Name": "Geography", "ParentId": 4},
    ];
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _matricController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _matricController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

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

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      matNumber: _matricController.text,
      gradStatus: clearValueGrad,
      tuition: clearValueTuition,
      domitory: clearValueDom,
      library: clearValueLib,
      lab: clearValueLab,
      department: selectedDept.toString(),
      faculty: selectedFaculty.toString(),
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const RoleScreen(),
        ),
      );
      //test run
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text('Student record saved successfully!'),
        ),
      );
    }
  }

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
              maxLength: 25,
              controller: _nameController,
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
              maxLength: 23,
              controller: _matricController,
              decoration: InputDecoration(
                counterText: '',
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
              'Create Password',
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
            // const SizedBox(height: 15),
            // const Text(
            //   'Faculty',
            //   style: Styles.fieldTextStyle,
            // ),
            // const SizedBox(height: 5),
            // SizedBox(
            //   height: 56,
            //   child: DropdownButtonFormField2(
            //     decoration: InputDecoration(
            //       //Add isDense true and zero Padding.
            //       //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            //       isDense: true,
            //       contentPadding: EdgeInsets.zero,
            //       border: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Colors.black,
            //         ),
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       //Add more decoration as you want here
            //       //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            //     ),
            //     isExpanded: true,
            //     hint: const Text(
            //       'Faculty*',
            //       style: Styles.hintTextStyle,
            //     ),
            //     icon: const Icon(
            //       Icons.arrow_drop_down,
            //       color: Colors.black45,
            //     ),
            //     iconSize: 30,
            //     buttonHeight: 58,
            //     buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            //     dropdownDecoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     items: facultyItems
            //         .map((item) => DropdownMenuItem<String>(
            //               value: item,
            //               child: Text(
            //                 item,
            //                 style: Styles.hintTextStyle,
            //               ),
            //             ))
            //         .toList(),
            //     validator: (value) {
            //       if (value == null) {
            //         return 'Please select a faculty.';
            //       }
            //     },
            //     onChanged: (value) {
            //       //Do something when changing the item if you want.
            //     },
            //     onSaved: (value) {
            //       selectedValue = value.toString();
            //     },
            //   ),
            // ),
            const SizedBox(height: 15),
            const Text(
              'Enter Stundent\'s Faculty ',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            FormHelper.dropDownWidget(
              context,
              'select faculty',
              this.facultyId,
              this.faculties,
              contentPadding: 16,
              paddingLeft: 0,
              paddingRight: 0,
              (onChangedVal) {
               var fid = this.facultyId = onChangedVal;
                print('selected faculty: $onChangedVal');

                this.departments = this
                    .departmentsMasters
                    .where(
                      (departmentItem) =>
                          departmentItem["ParentId"].toString() ==
                          onChangedVal.toString(),
                    )
                    .toList();
                this.departmentId = null;
                setState(() {});

                for (var element in this.faculties) {
                  if(element['id'] == int.parse(fid)) {
                    this.selectedFaculty = element['name'];
                  }
                }
                setState(() {
                  print(this.selectedFaculty);
                });

              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Please select faculty';
                }
                return null;
              },
              borderColor: Color.fromRGBO(20, 10, 38, 1),
              borderRadius: 15,
              // optionValue: 'id',
              // optionLabel: 'label',
            ),
            const SizedBox(height: 15),
            const Text(
              'Enter Stundent\'s Department',
              style: Styles.fieldTextStyle,
            ),
            const SizedBox(height: 5),
            FormHelper.dropDownWidget(
              context,
              'select department',
              this.departmentId,
              this.departments,
              contentPadding: 16,
              paddingLeft: 0,
              paddingRight: 0,
              (onChangedVal) {
                var id = this.departmentId = onChangedVal;

                print('selected department $onChangedVal');
                setState(() {

                });

                for (var element in this.departments) {
                  if(element['ID'] == int.parse(id)) {
                    this.selectedDept = element['Name'];
                  }
                }
                setState(() {
                  print(this.selectedDept);
                });

              },
              (onValidate) {
                return null;
              },
              borderColor: Color.fromRGBO(20, 10, 38, 1),
              borderRadius: 15,
              optionValue: 'ID',
              optionLabel: 'Name',
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
                    clearValueGrad
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    unclearValueGrad
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    clearValueTuition
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    unclearValueTuition
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    clearValueDom
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    unclearValueDom
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    clearValueLib
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
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
                    unclearValueLib
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            if (this.selectedFaculty == 'Science')...[
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
                      clearValueLab
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
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
                      unclearValueLab
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 35),
            Center(
              child: SizedBox(
                height: 52,
                width: 280,
                child: ElevatedButton(
                  onPressed: signUpUser,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
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

String? selectedValue;

final List<String> facultyItems = [
  'Science',
  'Art',
  'Social Science',
];
