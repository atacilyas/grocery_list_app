import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/theme/theme.dart';

class InvalidPasswordScreen extends StatelessWidget {
  const InvalidPasswordScreen({super.key});

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
            'The entered passwords do not match',
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
