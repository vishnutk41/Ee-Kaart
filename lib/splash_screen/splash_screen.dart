import 'dart:async';
import 'package:eekart/services/homeBLoc.dart';
import 'package:flutter/material.dart';


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
