import 'package:flutter/cupertino.dart';
import 'package:grocery_list_app/models/user.dart';
import 'package:grocery_list_app/providers/auth_provider.dart';

class RegisterController {
  RegisterController() : formKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKey;

  String email = '';
  String password = '';
  String passwordVerfier = '';
  String firstName = '';
  String lastName = '';
  DateTime birthDate = DateTime.now();

  Future<void> register() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      if (await AuthProvider.register(
        User(
          email: email,
          firstName: firstName,
          lastName: lastName,
          password: password,
          birthDate: birthDate,
        ),
      )) {
        return;
      } else {
        return Future.error('User already exists');
      }
    }

    if (!isEmailValid()) {
      return Future.error('invalid email');
    }

    return Future.error('Passwords are invalid');
  }

  bool isEmailValid() {
    return RegExp(
      r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}',
    ).hasMatch(email);
  }

  bool isPasswordValid() {
    return password.length > 6;
  }

  bool doPasswordsMatch() {
    return password.compareTo(passwordVerfier) == 0;
  }

  void emailChanged(String value) {
    email = value;
  }

  void passwordChanged(String value) {
    password = value;
  }

  void passwordVerifyChanged(String value) {
    passwordVerfier = value;
  }

  void lastNameChanged(String value) {
    lastName = value;
  }

  void firstNameChanged(String value) {
    firstName = value;
  }

  void birthDateChanged(DateTime value) {
    birthDate = value;
  }
}
