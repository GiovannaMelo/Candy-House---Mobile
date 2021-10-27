import 'package:flutter/material.dart';

class ButtonBorderWidget extends StatefulWidget {
  const ButtonBorderWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final void Function()? onPressed;
  @override
  _ButtonBorderWidgetState createState() => _ButtonBorderWidgetState();
}

class _ButtonBorderWidgetState extends State<ButtonBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 155,
      child: ElevatedButton(
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Color(0xFF5C5C5C),
            fontSize: 22,
          ),
        ),
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
               side: BorderSide(
                      color: Color(0xFFFF0065),
                      width: 3.0,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
