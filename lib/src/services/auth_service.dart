import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:fudi_app/src/views/pages/otp_page.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';
import 'package:fudi_app/src/views/pages/welcome_page.dart';


class AuthService{
  
  static final _auth = FirebaseAuth.instance;

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

  void sendVerificationEmail(User? user) async{
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  static Future<String?> createNewUser(BuildContext context, String email, String fullname, String username, String telephone, String birthday, String password) async {
    User? user;
    UserCredential userCredential;
    bool usernameAvailable = await UserService.checkUsername(username);
    
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