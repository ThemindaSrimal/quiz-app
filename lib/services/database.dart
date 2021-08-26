import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizData(Map<String, String> quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      // ignore: avoid_print
      print(e.toString());
    });
  }

  Future<void> addQuestionData(
      Map<String, String> questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      // ignore: avoid_print
      print(e.toString());
    });
  }
}
