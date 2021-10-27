import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 190),
        ),
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(
            Icons.menu,
            size: 60,
            color: Color(0xFFFF0065),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
        ),
        Text(
          "Home",
          style: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 25,
            color: Color(0xFF5C5C5C),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
        ),
        Icon(
          Icons.circle,
          size: 70,
          color: Color(0xFFFF0065),
        ),
      ],
    );
  }
}
