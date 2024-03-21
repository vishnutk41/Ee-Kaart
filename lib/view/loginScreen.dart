import 'package:eekart/services/authentication/firebaseopt.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';
  FireBaseAuth fireBaseAuth = FireBaseAuth();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null,
              onSaved: (value) =>userEmail = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value!.isEmpty || value.length < 6 ? "Password must be at least 6 characters long" : null,
              onSaved: (value) => userPassword = value!,
            ),
             ElevatedButton(
              onPressed: () {

                if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                fireBaseAuth.signInWithEmailAndPassword(userEmail, userPassword,context);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
