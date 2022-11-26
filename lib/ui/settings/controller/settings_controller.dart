import 'package:grocery_list_app/providers/auth_provider.dart';

class SettingsController {
  Future<void> signOut() async {
    return AuthProvider.signOut();
  }
}
