import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizapp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LocalUser _userFromFirebase(User user) {
    return LocalUser(uid: user.uid);
  }

  Future signInEmailAndPass(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = _auth.currentUser;
      return _userFromFirebase(user!);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      return _userFromFirebase(user!);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
