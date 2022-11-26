import 'package:flutter/cupertino.dart';
import 'package:grocery_list_app/models/grocery.dart';

class AddController {
  AddController()
      : item = Grocery(item: '', amount: 0),
        formKey = GlobalKey();

  Grocery item;
  GlobalKey<FormState> formKey;

  void nameChanged(String value) {
    item.item = value;
  }

  void amountChanged(String value) {
    item.amount = int.parse(value);
  }

  bool isValid() {
    formKey.currentState?.validate();
    return item.item.isNotEmpty;
  }
}
