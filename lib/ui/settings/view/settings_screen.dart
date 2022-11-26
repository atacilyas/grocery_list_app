import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/settings/settings.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key}) : _controller = SettingsController();

  final SettingsController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Log out'),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      content: LogOutConfirmation(
                        onConfirm: () {
                          _controller.signOut().then((value) {
                            Navigator.of(dialogContext).pop();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/',
                              (route) => false,
                            );
                          });
                        },
                        onCancel: () {
                          Navigator.of(dialogContext).pop();
                        },
                      ),
                    );
                  },
                );
              },
              trailing: const Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}
