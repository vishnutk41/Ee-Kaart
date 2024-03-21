

import 'package:eekart/view/loginScreen.dart';
import 'package:eekart/view/testScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireBaseAuth {

createUserWithEmailAndPassword(String emailAddress,String password, BuildContext context)async{
print('email:${emailAddress},password:${password}');
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
  print('response is : ${credential}');

  Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (context) => LoginScreen()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}

Future<void> signInWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  print('email: $emailAddress, password: $password');

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    String uid = credential.user?.uid ?? '';
    if (uid.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userUid', uid);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TestScreen()),
      );
    } else {
      print('Failed to obtain UID from Firebase User.');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

Future<void> showLogoutDialog(BuildContext context) async {
  bool confirmLogout = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Logout'),
      content: Text('Do you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Logout'),
        ),
      ],
    ),
  ) ?? false; 

  if (confirmLogout) {
    await logout(context);
  }
}

Future<void> logout(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userUid');
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}



}

