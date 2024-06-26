import 'package:eekart/splash_screen/splash_screen.dart';
import 'package:eekart/view/login.dart';
import 'package:eekart/view/signupScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/authentication/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // home: LoginScreen(),
      home: SignupScreen(),
    );
  }
}
