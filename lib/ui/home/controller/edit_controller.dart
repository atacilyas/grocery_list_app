import 'package:flutter/cupertino.dart';
import 'package:grocery_list_app/models/grocery.dart';

class EditController {
  EditController({required this.item}) : formKey = GlobalKey();
  GlobalKey<FormState> formKey;

  Grocery item;

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
