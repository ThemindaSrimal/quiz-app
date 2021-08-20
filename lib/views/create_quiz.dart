import 'package:flutter/material.dart';
import 'package:quizapp/widgets/widgets.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  late String quizImageUrl, quizTitle, quizDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: appBar(context)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black87),
          // ignore: deprecated_member_use
          brightness: Brightness.dark,
        ),
        body: Form(
          key: _formKey,
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Quiz Image Url' : null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Quiz Image Url (Optional)'),
                  onChanged: (val) {
                    quizImageUrl = val;
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Quiz Title' : null;
                  },
                  decoration: const InputDecoration(hintText: 'Quiz Title'),
                  onChanged: (val) {
                    quizTitle = val;
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Quiz Description' : null;
                  },
                  decoration:
                      const InputDecoration(hintText: 'Quiz Description'),
                  onChanged: (val) {
                    quizDescription = val;
                  },
                ),
                const Spacer()
              ],
            ),
          ),
        ));
  }
}
