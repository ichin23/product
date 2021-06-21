import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final bool help;
  final String? label;
  final TextInputType textType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? prefixLabel;
  final String? sufixLabel;
  final int minLines;
  final TextEditingController controller;
  CustomField(
      {Key? key,
      this.label,
      required this.help,
      required this.controller,
      required this.maxLines,
      this.minLines = 1,
      this.textType = TextInputType.name,
      this.validator,
      this.prefixLabel,
      this.sufixLabel})
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
              labelText: widget.label,
              prefixText: widget.prefixLabel,
              suffixText: widget.sufixLabel,
              // suffixIcon: Icon(
              //   Icons.help,
              // ),

              fillColor: Colors.white,
              filled: true,
              suffix: Icon(Icons.help),
              labelStyle: TextStyle(
                background: Paint()
                  ..color = Colors.white
                  ..strokeWidth = 20
                  ..style = PaintingStyle.stroke
                  ..strokeCap = StrokeCap.round
                  ..strokeJoin = StrokeJoin.round,
                color: Colors.black,
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red, width: 4)),
            ),
          )
        : TextFormField(
            keyboardType: widget.textType,
            validator: widget.validator,
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
              prefixText: widget.prefixLabel,
              suffixText: widget.sufixLabel,
              labelText: widget.label,
              alignLabelWithHint: false,
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(
                background: Paint()
                  ..color = Colors.white
                  ..strokeWidth = 20
                  ..style = PaintingStyle.stroke
                  ..strokeCap = StrokeCap.round
                  ..strokeJoin = StrokeJoin.round,
                color: Colors.black,
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red, width: 4)),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
  }
}
