// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDNlc9NJ0rfBmyXacQAxVlO2f74cXZtuXM',
    appId: '1:601806990712:web:7f41d48ed0830e97f4ac8d',
    messagingSenderId: '601806990712',
    projectId: 'eekart-a9ef0',
    authDomain: 'eekart-a9ef0.firebaseapp.com',
    storageBucket: 'eekart-a9ef0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoYR_xAUEedQjsZuMFJnEiyniTIhSQm3E',
    appId: '1:601806990712:android:b226faddf76ca1b7f4ac8d',
    messagingSenderId: '601806990712',
    projectId: 'eekart-a9ef0',
    storageBucket: 'eekart-a9ef0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqWvP1JBTHTcQVVINRU0inYu5vxTFh_XI',
    appId: '1:601806990712:ios:232327c248df9627f4ac8d',
    messagingSenderId: '601806990712',
    projectId: 'eekart-a9ef0',
    storageBucket: 'eekart-a9ef0.appspot.com',
    iosBundleId: 'com.example.eekart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqWvP1JBTHTcQVVINRU0inYu5vxTFh_XI',
    appId: '1:601806990712:ios:a5c9092c37855171f4ac8d',
    messagingSenderId: '601806990712',
    projectId: 'eekart-a9ef0',
    storageBucket: 'eekart-a9ef0.appspot.com',
    iosBundleId: 'com.example.eekart.RunnerTests',
  );
}
