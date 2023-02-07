import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';


class CustomDropDown extends StatelessWidget {
  final String hintText;
  final String? value;
  final List<String> options;
  final Function(String?)? onChanged;
  final bool isEdit;

  CustomDropDown({
    required this.onChanged,
    required this.hintText,
    this.value,
    required this.options,
    this.isEdit = false,
  });


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        isCollapsed: true,
        fillColor: whiteSecondary,
        contentPadding: const EdgeInsets.all(16.0),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: grayText,
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: bluePrimary),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: blackPrimary, width: 2),

          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      value: value,
      items: options.map((String option) {
        return DropdownMenuItem(
          child: Text(
            option,
            style: TextStyle(
              color: blackPrimary,
              fontSize: 14,
            ),
          ),
          value: option,
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
