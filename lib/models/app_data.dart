import 'package:grocery_list_app/models/user.dart';

class AppData {
  AppData({
    this.registeredUsers = const [],
    this.loggedInUser,
  });

  AppData.fromJson(Map<String, dynamic> json)
      : registeredUsers = (json['registeredUsers'] as List<dynamic>)
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList() {
    loggedInUser = json['loggedInUser'] as String?;
  }

  Map<String, dynamic> toJson() => {
        'registeredUsers': registeredUsers,
        'loggedInUser': loggedInUser,
      };

  List<User> registeredUsers;
  String? loggedInUser;

  bool isUserLoggedIn() {
    return loggedInUser != null;
  }
}
