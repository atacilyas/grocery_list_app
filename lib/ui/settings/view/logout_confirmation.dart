// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogOutConfirmation extends StatelessWidget {
  const LogOutConfirmation({
    super.key,
    this.onConfirm,
    this.onCancel,
  });

  final void Function()? onConfirm;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Are you sure you wish to log out?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
                onCancel?.call();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                onConfirm?.call();
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ],
    );
  }
}
