// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/firebase_options.dart';
import 'package:fudi_app/src/controllers/login_controller.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/services/restaurant_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  List<RestaurantModel> restaurantTemp = await RestaurantService().getAllRestaurants();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      )
    );

    

    // Here we start the App, calling LoginController()    

    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        accentColor: accentColorApp,
        buttonColor: buttonColorApp,
        disabledColor: disabledColorApp,
        scaffoldBackgroundColor: bgApp,
      ),
      
      // LoginController() will detect either the user has logged in or not returning a widget.
      // LoginController() can be find at Controllers.
      home: const LoginController(), 
    );
  }
}