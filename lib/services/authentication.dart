import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;

  Future<String> signupemail(email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser!.sendEmailVerification();
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return "Failed";
      }
    }
  }

  Future<String> signinemail(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return "Failed";
      }
    }
  }

  Future<String> signout() async {
    try {
      await _auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return "Failed";
    }
  }

  Future<String> deluser() async {
    try {
      await _auth.currentUser!.delete();
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return 'The user must reauthenticate before this operation can be executed.';
      }
      else{
        return "Failed";
      }
    }
  }

}