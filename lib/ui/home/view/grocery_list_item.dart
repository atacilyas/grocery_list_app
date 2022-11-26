import 'package:flutter/material.dart';
import 'package:grocery_list_app/ui/theme/theme_colors.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({
    super.key,
    required this.itemName,
    this.count = 1,
    this.unit = '',
    this.onEdit,
    this.onDelete,
  });

  final String itemName;
  final int count;
  final String unit;
  final void Function()? onEdit;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColors.backgroundBlue,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Text(
            '$count$unit',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          title: Text(
            itemName,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
              IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
