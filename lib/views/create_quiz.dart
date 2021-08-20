import 'package:flutter/material.dart';
import 'package:quizapp/widgets/widgets.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [],
        ),
      ),
    );
  }
}
