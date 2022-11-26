import 'package:flutter/cupertino.dart';
import 'package:grocery_list_app/providers/auth_provider.dart';

class LoginController {
  LoginController() : formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  final GlobalKey<FormState> formKey;

  Future<void> signIn() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      if (await AuthProvider.signIn(email, password)) {
        return;
      }
    }

    return Future.error('Failed to Sign in');
  }

  bool isEmailValid() {
    return RegExp(
      r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}',
    ).hasMatch(email);
  }

  bool isPasswordValid() {
    return password.length > 6;
  }

  void passwordChanged(String value) {
    password = value;
  }

  void emailChanged(String value) {
    email = value;
  }
}
