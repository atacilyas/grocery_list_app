import 'package:flutter/material.dart';

class DateTimeSelector extends StatefulWidget {
  const DateTimeSelector({
    super.key,
    this.listener,
  });

  final void Function(DateTime)? listener;

  @override
  State<DateTimeSelector> createState() => _DateTimeSelectorState();
}

class _DateTimeSelectorState extends State<DateTimeSelector> {
  _DateTimeSelectorState();
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: DateTime(1970),
          lastDate: DateTime(2050),
        ).then((value) {
          setState(() {
            _date = value ?? _date;
            widget.listener?.call(_date);
          });
        });
      },
      icon: const Icon(Icons.calendar_month),
      label: Text('${_date.day} / ${_date.month} / ${_date.year}'),
    );
  }
}
