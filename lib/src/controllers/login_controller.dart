import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/views/pages/otp_page.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';
import 'package:fudi_app/src/views/pages/welcome_page.dart';

/// This widget handles whenever the user logs in or logs out.

class LoginController extends StatelessWidget {
  const LoginController({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    AuthService.handleAuth(context);
    
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.active) {
          final bool signedIn = userSnapshot.hasData;
          User? user = FirebaseAuth.instance.currentUser;
          if(signedIn){
            if(user != null){
              if(user.emailVerified){
                return TabsPage();
              }
              else{
                return OTPPage();
              }
            }
          }
          else{
            return WelcomePage();
          }
        }
        return Container(
          color: Colors.black,
        );
      }
    );
  }
}