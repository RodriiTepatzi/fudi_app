import 'package:flutter/material.dart';

Widget headerText(String text, Color color, double size, FontWeight fontW){
  return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontW,
        fontSize: size,
      ),
  );
}

Widget headerTextCentered(String text, Color color, double size, FontWeight fontW){
  return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontWeight: fontW,
        fontSize: size,
      ),
  );
}

