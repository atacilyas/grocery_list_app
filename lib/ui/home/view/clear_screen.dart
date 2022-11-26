import 'package:flutter/material.dart';

class ClearScreen extends StatelessWidget {
  const ClearScreen({
    super.key,
    this.onConfirm,
    this.onCancel,
  });

  final void Function()? onConfirm;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Are you sure you wish to clear all groceries?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  onCancel?.call();
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  onConfirm?.call();
                },
                child: const Text('Clear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
