import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

Widget NavbarCategoryButton(String categoryText, int index, ValueSetter<int> onPressedFunc, ){
  void Function(int) onPressedFunction = onPressedFunc;
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: marginWidget,),
    decoration: BoxDecoration(
      //color: accentColorApp,
      borderRadius: BorderRadius.circular(roundedCornersValue),
    ),
    child: TextButton(
      onPressed: (){
        onPressedFunction(index);
      },
      style: ElevatedButton.styleFrom(
        primary: accentColorApp,
        minimumSize: const Size(20.0, 42.0),
      ),
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