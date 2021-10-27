import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key, required this.text, required this.icon, this.hint = " "})
      : super(key: key);
  final String text;
  final IconData icon;
  final String hint;
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Text(
                    widget.text.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: widget.hint,
                  suffixIcon: Icon(
                    widget.icon,
                    color: Color(0xFF5F5F5F),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      color: Color(0xFFFF0065),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      color: Color(0xFFFF0065),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
