import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_list_app/models/grocery.dart';
import 'package:grocery_list_app/ui/home/home.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key}) : _controller = AddController();

  final AddController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _controller.formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Grocery item',
                ),
                onChanged: _controller.nameChanged,
                validator: (value) {
                  if (value?.isNotEmpty ?? false) {
                    return null;
                  } else {
                    return 'Please enter the name of your groceries';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                onChanged: _controller.amountChanged,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.isValid()) {
                      Navigator.of(context).pop<Grocery>(_controller.item);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
