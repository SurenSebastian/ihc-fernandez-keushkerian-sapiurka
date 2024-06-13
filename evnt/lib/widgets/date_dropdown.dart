// in widgets/date_dropdown.dart
import 'package:flutter/material.dart';

class DateDropdown extends StatelessWidget {
  final List<String> items;
  final String? currentValue;
  final ValueChanged<String?> onChanged;
  final String hint;

  const DateDropdown({
    Key? key,
    required this.items,
    required this.currentValue,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text(hint),
      value: currentValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}