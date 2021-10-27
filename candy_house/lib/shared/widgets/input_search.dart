import 'package:flutter/material.dart';

class InputSearcWidget extends StatefulWidget {
  const InputSearcWidget({Key? key, required this.icon, required this.hint})
      : super(key: key);

  final IconData icon;
  final String hint;

  @override
  _InputSearcWidgetState createState() => _InputSearcWidgetState();
}

class _InputSearcWidgetState extends State<InputSearcWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 20),
            suffixIcon: Icon(
              widget.icon,
              color: Color(0xFF5F5F5F),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                color: Color(0xFFFF0065),
                width: 3.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(
                color: Color(0xFFFF0065),
                width: 3.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
