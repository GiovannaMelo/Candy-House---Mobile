import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key, required this.text, required this.onPressed, required this.color})
      : super(key: key);

  final String text;
  final Color color;
  final void Function()? onPressed;
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 155,
      child: ElevatedButton(
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
