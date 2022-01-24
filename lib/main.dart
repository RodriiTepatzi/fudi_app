// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      routes: routes,
      initialRoute: 'welcome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: accentColorApp,
        primaryColor: primaryColorApp,
        buttonColor: buttonColorApp,
        disabledColor: disabledColorApp,
        scaffoldBackgroundColor: bgApp,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color:Colors.black,
          ),
        ),
      ),
    );
  }
}