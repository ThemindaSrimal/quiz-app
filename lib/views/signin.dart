import 'package:flutter/material.dart';
import 'package:quizapp/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;

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
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 48,
                  child: const Text('Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 15.5),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 15.5, decoration: TextDecoration.underline),
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
