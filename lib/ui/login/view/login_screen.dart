import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/login/login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key}) : _controller = LoginController();

  final LoginController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              const Text('Sign in'),
              Text.rich(
                TextSpan(
                  text: "Don't have an account?",
                  children: [
                    WidgetSpan(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        style: TextButton.styleFrom(
                          alignment: Alignment.bottomLeft,
                        ),
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: _controller.emailChanged,
                  validator: (value) {
                    if (_controller.isEmailValid()) {
                      return null;
                    } else {
                      return 'This is not a valid email';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  onChanged: _controller.passwordChanged,
                  validator: (value) {
                    if (_controller.isPasswordValid()) {
                      return null;
                    } else {
                      return 'Password needs to be longer than 6';
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.signIn().then(
                    (value) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home',
                        (route) => false,
                      );
                    },
                  ).onError(
                    (String error, stackTrace) {
                      showDialog<void>(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                              content: LoginFailed(reason: error),);
                        },
                      );
                    },
                  );
                },
                child: const Text('Sign in'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
