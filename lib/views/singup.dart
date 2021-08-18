import 'package:flutter/material.dart';
import 'package:quizapp/views/signin.dart';
import 'package:quizapp/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String name, email, password;

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
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 48,
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
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
