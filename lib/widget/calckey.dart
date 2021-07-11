import 'package:flutter/material.dart';

class CalcKey extends StatelessWidget {
  final String keyText;
  final double fontSize;
  final Function() onKeyTap;
  CalcKey(
      {required this.keyText, this.fontSize = 42.0, required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      onPressed: () {
        onKeyTap();
      },
      child: Text(
        keyText,
        style: TextStyle(
          color: Colors.black54,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
