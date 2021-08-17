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
          child: Container(
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
                  height: 6,
                ),
              ],
            ),
          ),
        ));
  }
}
