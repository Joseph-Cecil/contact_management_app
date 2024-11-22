import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  final T? value;
  final String hint;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const Dropdown({
    Key? key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      hint: Text(hint),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
