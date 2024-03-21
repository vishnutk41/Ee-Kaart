import 'package:flutter/material.dart';
import '../services/authentication/firebaseopt.dart'; 

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';
  FireBaseAuth fireBaseAuth = FireBaseAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null,
              onSaved: (value) => userEmail = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value!.isEmpty || value.length < 6
                  ? "Password must be at least 6 characters long"
                  : null,
              onSaved: (value) => userPassword = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  fireBaseAuth.createUserWithEmailAndPassword(userEmail, userPassword,context);
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
