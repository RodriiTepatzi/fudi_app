// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/firebase_options.dart';
import 'package:fudi_app/src/controllers/cart_controller.dart';
import 'package:fudi_app/src/controllers/login_controller.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  // We initialize Firebase services. It uses the firebase_options.dart file.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // We run the app.
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

    // We create a ChangeNotifierProvider since the CartController is a singleton. 
    // Every change in cart will be updated from here.

    return ChangeNotifierProvider<CartController>(
      // Create the value that we are listening to.
      create: (context) => CartController.instance,
      child: MaterialApp(
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
        
        // LoginController() detects everything about the user when initializing the app.
        // It detects if the user is logged in or not. Also if the user has confirmed his phone number.
        home: const LoginController(), 
      ),
    );
  }
}