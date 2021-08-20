import 'package:flutter/material.dart';
import 'package:quizapp/views/create_quiz.dart';
import 'package:quizapp/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: appBar(context)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateQuiz()));
          },
        ));
  }
}
