import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/common_widgets/date_picker.dart';
import 'package:grocery_list_app/ui/register/register.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key}) : _controller = RegisterController();

  final RegisterController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              const Text('Register'),
              Text.rich(
                TextSpan(
                  text: 'Already have an account?',
                  children: [
                    WidgetSpan(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/',
                            (route) => false,
                          );
                        },
                        style: TextButton.styleFrom(
                          alignment: Alignment.bottomLeft,
                        ),
                        child: const Text('Sign in'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'First name',
                  ),
                  onChanged: _controller.firstNameChanged,
                  validator: (value) {
                    if (value?.isNotEmpty ?? false) {
                      return null;
                    } else {
                      return 'This is not a valid name';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                  ),
                  onChanged: _controller.lastNameChanged,
                  validator: (value) {
                    if (value?.isNotEmpty ?? false) {
                      return null;
                    } else {
                      return 'This is not a valid name';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    const Text('Birthdate'),
                    const SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: DateTimeSelector(
                        listener: _controller.birthDateChanged,
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
                      return 'The password should be longer than 6 characters';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirm password',
                  ),
                  onChanged: _controller.passwordVerifyChanged,
                  validator: (value) {
                    if (_controller.doPasswordsMatch()) {
                      return null;
                    } else {
                      return 'This is not the same password as entered earlier';
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.register().then((value) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home',
                      (route) => false,
                    );
                  }).onError((String error, stackTrace) {
                    showDialog<void>(
                      context: context,
                      builder: (dialogContext) {
                        if (error.contains('email')) {
                          return const AlertDialog(
                            content: InvalidEmailScreen(),
                          );
                        } else if (error.contains('user')) {
                          return const AlertDialog(
                            content: InvalidUserScreen(),
                          );
                        }
                        return const AlertDialog(
                          content: InvalidPasswordScreen(),
                        );
                      },
                    );
                  });
                },
                child: const Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
