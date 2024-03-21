
import 'package:eekart/view/loginScreen.dart';
import 'package:eekart/view/testScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBLoc {
  
  Future<String> getUserUid() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String uid = prefs.getString('userUid') ?? '';
  return uid;
}
void initiateApp(BuildContext context) async {
  String uid = await getUserUid();
  if (uid.isNotEmpty) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TestScreen()), 
    );
  } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

}    