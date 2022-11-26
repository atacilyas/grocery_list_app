import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/home/home.dart';
import 'package:grocery_list_app/ui/login/login.dart';
import 'package:grocery_list_app/ui/register/register.dart';
import 'package:grocery_list_app/ui/settings/settings.dart';
import 'package:grocery_list_app/ui/theme/theme.dart';

class GroceryListApp extends StatelessWidget {
  const GroceryListApp({
    super.key,
    required this.isSignedInOnStartup,
  });

  final bool isSignedInOnStartup;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List App',
      theme: appTheme,
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      initialRoute: isSignedInOnStartup ? '/home' : '/',
    );
  }
}
