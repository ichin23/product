import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final bool help;
  final TextInputType textType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int minLines;
  final TextEditingController controller;
  CustomField(
      {Key? key,
      required this.help,
      required this.controller,
      required this.maxLines,
      this.minLines = 1,
      this.textType = TextInputType.name,
      this.validator})
      : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return (widget.help)
        ? TextFormField(
            keyboardType: widget.textType,
            validator: widget.validator,
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.help),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 4)),
            ),
          )
        : TextFormField(
            keyboardType: widget.textType,
            validator: widget.validator,
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.red, width: 4)),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
  }
}
