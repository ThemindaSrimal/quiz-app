import 'package:flutter/material.dart';
import 'package:quizapp/helper/functions.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/views/signin.dart';
import 'package:quizapp/widgets/widgets.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String name, email, password;
  // ignore: unnecessary_new
  AuthService authService = new AuthService();
  bool isLoading = false;

  // ignore: non_constant_identifier_names
  signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      authService.signUpWithEmailAndPassword(email, password).then((value) {
        if (value != null) {
          setState(() {
            isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedIn: true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: appBar(context)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          // ignore: deprecated_member_use
          brightness: Brightness.light,
        ),
        body: isLoading
            // ignore: avoid_unnecessary_containers
            ? Container(
                // ignore: prefer_const_constructors
                child: Center(
                  // ignore: prefer_const_constructors
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const Spacer(),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? 'Enter Name' : null;
                        },
                        decoration: const InputDecoration(hintText: 'Name'),
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? 'Enter Email' : null;
                        },
                        decoration: const InputDecoration(hintText: 'Email'),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val!.isEmpty ? 'Enter Password' : null;
                        },
                        decoration: const InputDecoration(hintText: 'Password'),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () => signUp(),
                        child: blueButton(context: context, label: 'Sign Up'),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(fontSize: 15.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 15.5,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
