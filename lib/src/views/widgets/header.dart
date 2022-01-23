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

Widget headerWithActionIcon(BuildContext context, String textHeader, String textAction, Function()? action, IconData? iconAction){
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: MediaQuery.of(context).size.width / 2,
        child: headerText(textHeader, Colors.black, 24.0, FontWeight.bold),
      ),
      const Spacer(),
      GestureDetector(
        onTap: action,
        child: Container(
          child: Row(
            children: [
              Text(
                textAction,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
              Icon(iconAction),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget headerWithAction(BuildContext context, String textHeader, String textAction, Function()? action){
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: MediaQuery.of(context).size.width / 2,
        child: headerText(textHeader, Colors.black, 24.0, FontWeight.bold),
      ),
      const Spacer(),
      GestureDetector(
        onTap: action,
        child: Container(
          child: Row(
            children: [
              Text(
                textAction,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

