import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siak_app/ui/constant/constant.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final IconData? icon;

  CustomTextField({
    required this.hintText,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    // this.errorValidation,
    this.inputFormatter,
    this.icon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      showCursor: true,
      cursorColor: Theme.of(context).iconTheme.color,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatter,
      maxLines: (maxLines != null) ? maxLines : 1,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(16.0),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: bluePrimary),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        prefixIcon: Icon(icon, color: bluePrimary, size: 20),
        hintStyle:
        styleTitle.copyWith(fontSize: setFontSize(40), fontWeight: FontWeight.w400),
      ),
      validator: validator);

  }
}
