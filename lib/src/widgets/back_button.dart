import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget backButtonTransparent(BuildContext context,Color color){
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: color,
      size: 28.0,
    ),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}

Widget backButtonDarkBrightness(BuildContext context,Color color){
  return IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: color,
      size: 28.0,
    ),
    onPressed: (){
      Navigator.pop(context);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      );
    },
  );
  
}