import 'package:flutter/widgets.dart';
import 'package:grocery_list_app/providers/auth_provider.dart';
import 'package:grocery_list_app/ui/app/app.dart';

Future<void> main() async {
  final isSignedInOnStartup = await AuthProvider.isSignedIn;
  runApp(
    GroceryListApp(
      isSignedInOnStartup: isSignedInOnStartup,
    ),
  );
}
