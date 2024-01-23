import 'package:chat_box/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  DataBase db = DataBase();

  Future signUpUser(
    String name,
    String email,
    String firstPassword,
    String secondPassword,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: secondPassword);
      db.saveUserData(
          name, email, firstPassword, secondPassword, userCredential.user!.uid);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('Password is too Weak');
      } else if (e.code == 'email-already-in-use') {
        print('Email in use');
      }
    }
  }

  Future logInUser(String email, String password, BuildContext context) async {
    String res = 'Some Error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        res = 'Log In Sucessfull';
      }
    } on FirebaseException catch (e) {
      res = e.toString();
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No User Found for this email'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong Password'),
          ),
        );
      }
    }
  }
}
