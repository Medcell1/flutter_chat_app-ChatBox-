import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  Future saveUserData(
      String name,
      String email,
      String firstPassword,
      String secondPassword,
      uid,
      ) async{
    FirebaseFirestore.instance.collection("users").doc(uid).set({
      "name" : name,
      "email": email,
      "firstPassword": firstPassword,
      "secondPassword": secondPassword,
    });
  }
}