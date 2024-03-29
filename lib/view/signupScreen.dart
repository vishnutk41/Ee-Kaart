import 'package:eekart/view/login.dart';
import 'package:flutter/material.dart';
import '../services/authentication/firebaseopt.dart'; 

import 'package:eekart/routeManager.dart';
import 'package:eekart/services/authentication/firebaseopt.dart';
import 'package:eekart/view/signupScreen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';
  FireBaseAuth fireBaseAuth = FireBaseAuth();
  RouteManager routeManager=RouteManager(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900]!,
          Colors.orange[800]!,
          Colors.orange[400]!
        ]
        )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create Your Account",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                    key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]!))),
                                  child: 
                    
                                  TextFormField(
                                  decoration: const InputDecoration(labelText: 'Email',
                                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                  validator: (value) => value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null,
                                  onSaved: (value) =>userEmail = value!,
                                ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]!))),
                                  child: 
                    
                                  TextFormField(
                                  decoration: const InputDecoration(labelText: 'Password',
                                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                  obscureText: true,
                                  validator: (value) => value!.isEmpty || value.length < 6 ? "Password must be at least 6 characters long" : null,
                                  onSaved: (value) => userPassword = value!,
                                ),
                                ),
                              ],
                            ),
                          ),
                    
                    
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                                          onTap: () {
                    
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  fireBaseAuth.createUserWithEmailAndPassword(userEmail, userPassword,context);
                }
                                  },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.orange[900]),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Dont have an Account? ",
                                style: TextStyle(color: Colors.grey),
                              ),
                                GestureDetector(
                                  onTap: () =>
                                 Navigator.of(context).push(routeManager.createRoute(const LoginScreen())),
                    
                    
                                  child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.orange[900]),
                                                            ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String userEmail = '';
//   String userPassword = '';
//   FireBaseAuth fireBaseAuth = FireBaseAuth();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Email'),
//               validator: (value) =>
//                   value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null,
//               onSaved: (value) => userEmail = value!,
//             ),
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//               validator: (value) => value!.isEmpty || value.length < 6
//                   ? "Password must be at least 6 characters long"
//                   : null,
//               onSaved: (value) => userPassword = value!,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   fireBaseAuth.createUserWithEmailAndPassword(userEmail, userPassword,context);
//                 }
//               },
//               child: const Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
