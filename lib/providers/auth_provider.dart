import 'package:collection/collection.dart';
import 'package:grocery_list_app/models/app_data.dart';
import 'package:grocery_list_app/models/user.dart';
import 'package:grocery_list_app/services/database.dart';
import 'package:grocery_list_app/services/local_storage.dart';

class AuthProvider {
  static final DB database = LocalStorage();

  static Future<bool> register(User user) async {
    AppData? appData;
    try {
      final json = await database.load() as Map<String, dynamic>;
      appData = AppData.fromJson(json);
    } catch (_) {}

    appData ??= AppData();

    if (appData.registeredUsers.any((element) => element.email == user.email)) {
      return false;
    }

    appData
      ..registeredUsers = [...appData.registeredUsers, user]
      ..loggedInUser = user.email;
    database.save(appData);

    return true;
  }

  static Future<void> signOut() async {
    try {
      final json = await database.load() as Map<String, dynamic>;
      final appData = AppData.fromJson(json)..loggedInUser = null;
      database.save(appData);
    } catch (_) {}
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      final json = await database.load() as Map<String, dynamic>;
      final appData = AppData.fromJson(json);

      final user = appData.registeredUsers.firstWhereOrNull(
        (element) => element.email == email && element.password == password,
      );

      if (user == null) {
        return false;
      }

      appData.loggedInUser = user.email;
      database.save(appData);
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> get isSignedIn async {
    try {
      final json = await database.load() as Map<String, dynamic>;
      final appData = AppData.fromJson(json);
      return appData.isUserLoggedIn();
    } catch (_) {
      return false;
    }
  }

  static Future<User> getCurrentUser() async {
    AppData? appData;
    try {
      final json = await database.load() as Map<String, dynamic>;
      appData = AppData.fromJson(json);
      return appData.registeredUsers
          .firstWhere((element) => element.email == appData?.loggedInUser);
    } catch (_) {}

    return Future.error('user not found');
  }

  static Future<bool> updateUser(User user) async {
    AppData? appData;
    try {
      final json = await database.load() as Map<String, dynamic>;
      appData = AppData.fromJson(json);
    } catch (_) {}

    appData ??= AppData();

    if (!appData.registeredUsers
        .any((element) => element.email == user.email)) {
      return false;
    }

    appData
      ..registeredUsers = [
        ...appData.registeredUsers
            .whereNot((element) => element.email == user.email),
        user,
      ]
      ..loggedInUser = user.email;
    database.save(appData);

    return true;
  }
}
