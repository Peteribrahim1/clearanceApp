import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final currentUser = FirebaseAuth.instance.currentUser;

  //signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String matNumber,
    required bool gradStatus,
    required bool tuition,
    required bool domitory,
    required bool library,
    required bool lab,
  }) async {
    String res = 'Please enter all the fields';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          matNumber.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'matricNumber': matNumber,
          'graduationStatus': gradStatus,
          'tuitionFee': tuition,
          'domitoryFee': domitory,
          'library': library,
          'laboratory': lab,
          'uid': cred.user!.uid,
        });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
    required String matric,
    //required String dbMatric,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {

          await _auth.signInWithEmailAndPassword(
              email: email, password: password);

          res = 'success';

      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Future<String> loginUser({
  //   required String email,
  //   required String password,
  //   required String matric,
  //   required String dbMatric,
  // }) async {
  //   String res = 'Some error occured';
  //
  //   try {
  //     if (email.isNotEmpty && password.isNotEmpty && matric.isNotEmpty) {
  //       if (matric == dbMatric) {
  //         await _auth.signInWithEmailAndPassword(
  //             email: email, password: password);
  //
  //         res = 'success';
  //       }
  //
  //     } else {
  //       res = 'Please enter all the fields';
  //     }
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }


}
