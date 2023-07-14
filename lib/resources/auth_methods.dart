import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final currentUser = FirebaseAuth.instance.currentUser;

  //signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required bool gradStatus,
    required bool tuition,
    required bool domitory,
    required bool clinic,
    required bool library,
    required bool lab,
    required String department,
    required String faculty,
  }) async {
    String res = 'Please enter all the fields';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          name.isNotEmpty &&
          department != null &&
          faculty != null) {

        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'graduationStatus': gradStatus,
          'tuitionFee': tuition,
          'domitoryFee': domitory,
          'clinicStatus': clinic,
          'library': library,
          'laboratory': lab,
          'uid': cred.user!.uid,
          'department': department,
          'faculty': faculty,
          'password': password,
        });
        res = 'success';
      }
    } on FirebaseAuthException catch(err) {
      print(err.code);
      if (err.code == 'invalid-email') {
        res = 'Wrong email format';
      } else if (err.code == 'weak-password') {
        res = 'matric number cannot be less than 6 characters';
      } else if (err.code == 'email-already-in-use') {
        res = 'User already exist';
      }
    }


    catch (err) {
      res = err.toString();
      print(err.toString());
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
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
    } on FirebaseAuthException catch(err) {
      print(err.code);
      if (err.code == 'invalid-email') {
        res = 'Wrong email format';
      } else if (err.code == 'user-not-found') {
        res = 'user does not exist';
      } else if (err.code == 'wrong-password') {
        res = 'Wrong matric number';
      }
    }

    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
