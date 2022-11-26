import 'package:grocery_list_app/models/grocery.dart';
import 'package:grocery_list_app/models/user.dart';
import 'package:grocery_list_app/providers/auth_provider.dart';

class HomeController {
  HomeController();

  Future<void> initialize() async {
    return AuthProvider.getCurrentUser().then((value) {
      currentUser = value;
    });
  }

  User? currentUser;

  void addGrocery(Grocery grocery) {
    currentUser?.groceries.add(grocery);
    if (currentUser != null) {
      AuthProvider.updateUser(currentUser!);
    }
  }

  void updateGrocery(int index, Grocery item) {
    currentUser?.groceries[index] = item;
    if (currentUser != null) {
      AuthProvider.updateUser(currentUser!);
    }
  }

  void removeGrocery(int index) {
    currentUser?.groceries.removeAt(index);
    if (currentUser != null) {
      AuthProvider.updateUser(currentUser!);
    }
  }

  void clearGroceries() {
    currentUser?.groceries = [];
    if (currentUser != null) {
      AuthProvider.updateUser(currentUser!);
    }
  }
}
