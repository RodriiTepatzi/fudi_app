import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/views/pages/login_page.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';
import 'package:fudi_app/src/views/pages/welcome_page.dart';

class LoginController extends StatelessWidget {
  const LoginController({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        
      } 
      else {
        TabsPage();
      }
    });

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.active) {
          final bool signedIn = userSnapshot.hasData;
          return signedIn ? TabsPage() : WelcomePage();
        }
        return Container(
          color: Colors.black,
        );
      }
    );
  }
}