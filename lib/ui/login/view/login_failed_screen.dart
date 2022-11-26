import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/theme/theme.dart';

class LoginFailed extends StatelessWidget {
  const LoginFailed({
    super.key,
    this.reason = 'Unkown',
  });

  final String reason;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            color: ThemeColors.backgroundBlue,
            child: Image.asset('assets/password_error.png'),
          ),
          const SizedBox(height: 15),
          const Text(
            'Login failed',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
