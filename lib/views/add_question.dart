// ignore_for_file: avoid_unnecessary_containers, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3, option4;

  uploadQuizData() {}

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
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Question' : null;
                  },
                  decoration: const InputDecoration(hintText: 'Question'),
                  onChanged: (val) {
                    question = val;
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Option1' : null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Option1 (Correct Answer)'),
                  onChanged: (val) {
                    option1 = val;
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Option2' : null;
                  },
                  decoration: const InputDecoration(hintText: 'Option2'),
                  onChanged: (val) {
                    option1 = val;
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Option3' : null;
                  },
                  decoration: const InputDecoration(hintText: 'Option3'),
                  onChanged: (val) {
                    option3 = val;
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? 'Enter Option4' : null;
                  },
                  decoration: const InputDecoration(hintText: 'Option4'),
                  onChanged: (val) {
                    option4 = val;
                  },
                ),
                Spacer(),
                Row(
                  children: [
                    blueButton(
                        context: context,
                        label: 'Submit',
                        buttonWidth:
                            MediaQuery.of(context).size.width / 2 - 36),
                    SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: blueButton(
                          context: context,
                          label: 'Add Question',
                          buttonWidth:
                              MediaQuery.of(context).size.width / 2 - 36),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )));
  }
}
