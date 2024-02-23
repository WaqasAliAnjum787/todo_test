import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/data/data/app_colors.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final Function(String?)? onChanged;
  final String? value;

  const CustomDropDown({
    Key? key,
    required this.items,
    required this.hint,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(Icons.arrow_drop_down_circle, color: AppColors.kGrey2),
      items: widget.items
          .map((e) =>
              DropdownMenuItem(child: Text(e.capitalizeFirst!), value: e))
          .toList(),
      hint: Text(widget.hint),
      value: widget.value ?? widget.items.first,
      onChanged: (String? newValue) {
        setState(() {
          _value = newValue;
          widget.onChanged?.call(newValue);
        });
      },
    );
  }
}
