import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental_room_app/Contract/login_contract.dart';
import 'package:string_validator/string_validator.dart';

class LoginPresenter {
  final LoginViewContract? _view;
  LoginPresenter(this._view);

  Future<void> login(String email, String password) async {
    email = email.trim();
    password = password.trim();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _view?.onLoginFailed();
      return;
    }
    _view?.onLoginSucceeded();
    //TODO: Push to HomeScreen handle
  }

  String? validateEmail(String? email) {
    email = email?.trim();
    if (email == null || email.isEmpty) {
      return "Please enter your email!";
    } else if (!isEmail(email)) {
      return "Email is not in the correct format!";
    }
    return null;
  }

  String? validatePassword(String? password) {
    password = password?.trim();
    if (password == null || password.isEmpty) {
      return "Please enter your password!";
    }
    return null;
  }
}
