import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/models/user_model.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;

  static Future register(UserModel user) async {
    final credential = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    return true;
      return false;
  }

  static Future login(String email, String password) async {
    final credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return true;
      return false;
  }

  static Future logout() async {
    await auth.signOut();
    return true;
  }
}
