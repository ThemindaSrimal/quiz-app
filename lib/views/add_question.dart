// ignore_for_file: avoid_unnecessary_containers, unused_field, prefer_const_constructors, prefer_final_fields, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/services/database.dart';
import 'package:quizapp/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3, option4;
  bool _isLoading = false;

  DatabaseService databaseService = DatabaseService();

  uploadQuestionData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> questionMap = {
        'question': question,
        'option1': option1,
        'option2': option2,
        'option3': option3,
        'option4': option4,
      };
      await databaseService
          .addQuestionData(questionMap, widget.quizId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
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
          iconTheme: const IconThemeData(color: Colors.black87),
          // ignore: deprecated_member_use
          brightness: Brightness.dark,
        ),
        body: _isLoading
            ? Container(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : Container(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: blueButton(
                              context: context,
                              label: 'Submit',
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2 - 36),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            uploadQuestionData();
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
