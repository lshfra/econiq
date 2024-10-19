
import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password,
      );
      return userCredential.user != null;
    } catch (e) {
      throw Exception("Failed to login: ${e.toString()}");
    }
  }
}