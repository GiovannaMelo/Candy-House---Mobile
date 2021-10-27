import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonNextWidget extends StatefulWidget {
  const ButtonNextWidget({ Key? key, required this.text, required this.onPressed }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonNextWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink.shade400),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
        ),
      ),
    );
  }
}