import 'package:grocery_list_app/models/grocery.dart';

class User {
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.birthDate,
    this.groceries = const <Grocery>[],
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String,
        firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        password = json['password'] as String,
        birthDate = DateTime.parse(json['birthDate'] as String),
        groceries = (json['groceries'] as List<dynamic>)
            .map((e) => Grocery.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'birthDate': birthDate.toIso8601String(),
        'groceries': groceries,
      };

  String email;
  String firstName;
  String lastName;
  String password;
  DateTime birthDate;
  List<Grocery> groceries;
}
