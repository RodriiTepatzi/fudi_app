import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:fudi_app/src/views/pages/otp_page.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';
import 'package:fudi_app/src/views/pages/welcome_page.dart';

/// AuthService contains methods to handle the authentication.
/// 
/// - To handle authentication this method should be called: 
/// ```dart
/// AuthService.handleAuth(BuildContext context)
/// ```
/// 
/// - To log-out should be done using:
/// ```dart
/// AuthService.signOut();
/// ```

class AuthService{
  
  static final _auth = FirebaseAuth.instance;

  /// - If the user is logged in and its `phoneNumber` is verified, the method will redirect to TabsPage. 
  /// 
  /// - If the user is logged in and the `phoneNumber` is not verified, the method will redirect to OTPPage
  /// 
  /// - so the user can verify the OTP code.
  /// 
  /// - If the user is logged out or logs out, the method will redirect to WelcomePage.
  /// 
  /// - `BuildContext context` is required to create builder from wherever this method is called. 
  static handleAuth(BuildContext context){
    _auth
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
            builder: (context) => WelcomePage()
          ), 
         ModalRoute.withName("/")
        );
      }
      else {
        if(user.phoneNumber != null && user.phoneNumber.toString().isNotEmpty){
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => TabsPage()
            ), 
           ModalRoute.withName("/")
          );
        }
        else {
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => OTPPage(user: user,)
            ), 
            ModalRoute.withName("/")
          );
        }
      }
    });
  }

  /// This method should be called whenever needs to prompt a Email Verification.
  void sendVerificationEmail(User? user) async{
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  /// This methods creates a new user and return a success or error messages as `String`.
  static Future<String?> createNewUser(BuildContext context, String email, String fullname, String username, String telephone, DateTime birthday, String password) async {
    User? user;
    /*UserCredential userCredential;
    bool usernameAvailable = await UserService.checkUsername(username);*/
    
    //if(usernameAvailable){
      try{
        user = (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
        UserApp userApp = UserApp(uid: user!.uid, username: username, fullname: fullname, birthday: birthday, email: email, photoURL: "", telephone: telephone);
        UserService.createUser(userApp).whenComplete((){
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => OTPPage(user: user,)
            ), 
            ModalRoute.withName("/")
          );
        });
        
      }on FirebaseAuthException catch (e) {
        if(e.code == "email-already-in-use"){
          return "El email ya esta en uso.";
        }
        else if(e.code == "weak-password"){
          return "Contraseña muy débil.";
        }
      }
    /*}
    else{
      return "Nombre de usuario en uso.";
    }*/
  }

  /// This method logs-out the current user.
  static signOut() {
    _auth.signOut();
  }

  signInWithCredentials(AuthCredential authCreds) {
    _auth.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signInWithCredentials(authCreds);
  }

  /// This method should be called, when trying to login with email and password.
  static Future<String?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Usuario no encontrado';
      } else if (e.code == 'wrong-password') {
        return 'Contraseña incorrecta.';
      }
    }
  }

}