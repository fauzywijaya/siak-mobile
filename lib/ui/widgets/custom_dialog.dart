
import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';

class CustomDialog extends StatefulWidget {
  final Widget title;
  final Widget content;
  const CustomDialog(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      title: widget.title,
      content: widget.content,
      actions: [
        TextButton(
          child:  Text(
            'Oke',
            style: TextStyle(color: bluePrimary),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
