import 'package:candy_house/modulos/login/page/login_page.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'input.dart';

class StepWidget extends StatefulWidget {
  const StepWidget({Key? key, this.currentIndex = 1}) : super(key: key);

  final int currentIndex;

  @override
  _StepWidgetState createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        SizedBox(
          width: 400,
          height: 60,
          child: Stack(
            children: <Widget>[
              Container(
                height: 60,
                child: Center(
                  child: Container(
                    width: 340,
                    height: 15,
                    color: Color(0xFFFF0065),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageCupcake(1),
                  SizedBox(
                    width: 90,
                  ),
                  imageCupcake(2),
                  SizedBox(
                    width: 90,
                  ),
                  imageCupcake(3)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Container imageCupcake(int index) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.currentIndex >= index
              ? "assets/images/step-terminate.png"
              : "assets/images/step-pending.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "$index",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Salsa'),
      ),
    );
  }
}
