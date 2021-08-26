// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:quizapp/services/database.dart';
import 'package:quizapp/views/add_question.dart';
import 'package:quizapp/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  late String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = DatabaseService();

  bool _isLoading = false;

  createQuizOnline() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgUrl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDescription
      };

      await databaseService
          .addQuizData(quizMap, quizId)
          .then((value) => setState(() {
                _isLoading = false;
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddQuestion()));
              }));
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
            // ignore: avoid_unnecessary_containers
            ? Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formKey,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        decoration:
                            const InputDecoration(hintText: 'Quiz Title'),
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
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            createQuizOnline();
                          },
                          child: blueButton(context, 'Create Quiz')),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
