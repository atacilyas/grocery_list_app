import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list_app/models/grocery.dart';
import 'package:grocery_list_app/ui/home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState() : _controller = HomeController();

  @override
  void initState() {
    super.initState();

    _controller.initialize().then((value) => setState(() {}));
  }

  late final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showDialog<Grocery?>(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  child: AddScreen(),
                );
              },
            ).then((value) {
              if (value != null) {
                _controller.addGrocery(value);
                setState(() {});
              }
            });
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<Grocery?>(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                child: ClearScreen(
                  onCancel: () {
                    Navigator.of(dialogContext).pop();
                  },
                  onConfirm: () {
                    _controller.clearGroceries();
                    setState(() {});
                    Navigator.of(dialogContext).pop();
                  },
                ),
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.delete_forever),
            Text(
              'Clear',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: _controller.currentUser?.groceries
                .mapIndexed(
                  (index, grocery) => GroceryListItem(
                    itemName: grocery.item,
                    count: grocery.amount,
                    onEdit: () {
                      showDialog<Grocery?>(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            child: EditScreen(
                              item: grocery,
                            ),
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          _controller.updateGrocery(index, value);
                          setState(() {});
                        }
                      });
                    },
                    onDelete: () {
                      _controller.removeGrocery(index);
                      setState(() {});
                    },
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
