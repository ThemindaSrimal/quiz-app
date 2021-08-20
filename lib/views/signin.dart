import 'package:flutter/material.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/views/singup.dart';
import 'package:quizapp/widgets/widgets.dart';
import 'home.dart';

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
  // ignore: unnecessary_new
  AuthService authService = new AuthService();
  bool isLoading = false;

  signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((val) {
        if (val != null) {
          setState(() {
            isLoading = false;
          });
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
                child: const Center(
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
                        onTap: () => signIn(),
                        child: blueButton(context, 'Sign In'),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 15.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              'Sign Up',
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
