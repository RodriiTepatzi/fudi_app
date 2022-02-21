// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/widgets/header.dart';

void showAlertDialog(BuildContext context, 
  //ImageProvider<Object> imagePath,
  IconData icon,
  String headerTitle,
  String headerSubtitle,
  String labelButton)
async { 
  await showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context){
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        content: IntrinsicHeight(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 80,
                  color: accentColorApp,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: headerTextCentered(headerTitle, textColorApp, 24.0, FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    headerSubtitle,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: textColorApp,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                _doneButton(context, labelButton),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _doneButton(BuildContext context, String labelButton){
  return Container(
    width: 370,
    height: 45.0,
    margin: const EdgeInsets.only(top: 20.0),
    child: RaisedButton(
      onPressed: (){
        Navigator.pop(context);
      },
      color: accentColorApp,
      child: const Text(
        'Hecho',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}