import 'package:flutter/material.dart';

class FeedbackTextField extends StatelessWidget {
  const FeedbackTextField({
    @required this.key,
    @required this.onChanged,
    this.hintText,
    this.showCounter = false,
    this.height = 40,
    this.maxLength,
    this.maxLines = 1,
  });

  final Key key;
  final num height;
  final void Function(String value) onChanged;
  final bool showCounter;
  final int maxLength;
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: height,
        child: TextField(
          key: key,
          onChanged: onChanged,
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 16, top: 22),
            fillColor: Colors.white,
            counterStyle: TextStyle(height: 0),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[100],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
