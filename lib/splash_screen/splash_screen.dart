import 'dart:async';
import 'package:eekart/view/loginScreen.dart';
import 'package:eekart/view/testScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc with ChangeNotifier {
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

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => homeBloc.initiateApp(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/UDB.png'),
      ),
    );
  }
}
