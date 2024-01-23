import 'package:chat_box/services/authservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpAuthenticationProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  final signUpFormKey = GlobalKey<FormState>();
  String email = '';
  String name = '';
  String firstPassword = '';
  String secondPassword = '';
  bool isLoading = false;

  setIsLoadingToTrue() {
    isLoading = true;
    notifyListeners();
  }

  setIsLoadingToFalse() {
    isLoading = false;
    notifyListeners();
  }

  setName(String value) {
    name = value;
    notifyListeners();
  }

  setEmail(String value) {
    email = value;
    notifyListeners();
  }

  setFirstPassword(String value) {
    firstPassword = value;
    notifyListeners();
  }

  setSecondPassword(String value) {
    secondPassword = value;
    notifyListeners();
  }

  signUpUser(context) async {
    setIsLoadingToTrue();
    if (signUpFormKey.currentState!.validate()) {
      signUpFormKey.currentState!.save();
      await authService.signUpUser(
        name,
        email,
        firstPassword,
        secondPassword,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration Successful'),
        ),
      );

      setIsLoadingToFalse();
    } else {
      setIsLoadingToFalse();
    }
  }
}

class LogInAuthenticationProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  final logInFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  setIsLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  setIsLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  setEmail(String value) {
    email = value;
    notifyListeners();
  }

  setPassWord(String value) {
    password = value;
    notifyListeners();
  }

  AuthService auth = AuthService();

  logInUser(BuildContext context) async {
    setIsLoadingTrue();
    if (logInFormKey.currentState!.validate()) {
      logInFormKey.currentState!.save();
      await auth.logInUser(email, password, context);
      setIsLoadingFalse();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Log In Sucessfull'),
        ),
      );
    } else {
      setIsLoadingFalse();
    }
  }
}
