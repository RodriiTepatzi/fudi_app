import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

Widget CategoryItem(String categoryText, int index, Function()? onPressedFunc){
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: marginWidget,),
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: accentColorApp,
      borderRadius: BorderRadius.circular(roundedCornersValue),
    ),
    child: ElevatedButton(
      onPressed: onPressedFunc,
      child: Text(
        categoryText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    )
  );
}