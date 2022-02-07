import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/views/pages/otp_page.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';
import 'package:fudi_app/src/views/pages/welcome_page.dart';


class AuthService{
  
  handleAuth(BuildContext context){
    FirebaseAuth.instance
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
        if(user.phoneNumber!.isNotEmpty){
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => TabsPage()
            ), 
           ModalRoute.withName("/")
          );
        }
        else{
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

  Future<String?> createNewUser(BuildContext context, String email, String fullname, String username, String telephone, DateTime birthday, String password) async {
    User? user;
    UserCredential userCredential;
    bool usernameAvailable = false;


    (await checkUsername(username).then((value) => usernameAvailable = value));
    
    //if(usernameAvailable){

      try{
        user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
        //FirebaseAuth.instance.currentUser.updatePhoneNumber(phoneCredential);
        setDataToCollection(UserApp(uid: user!.uid, username: username, fullname: fullname, birthday: birthday, email: email, photoURL: "", telephone: telephone));
        Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(
              builder: (context) => OTPPage(user: user,)
            ), 
           ModalRoute.withName("/")
        );
      }on FirebaseAuthException catch (e) {
        if(e.code == "email-already-in-use"){
          return "El email ya esta en uso.";
        }
        else if(e.code == "weak-password"){
          return "Contraseña muy débil.";
        }
      }

      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
        FirebaseAuth.instance.signInWithCredential(credential);
      }  else {
        
      }
    /*}
    else{
      return "Nombre de usuario en uso.";
    }*/

    //FirebaseAuth.instance.currentUser?.updateDisplayName(fullname);  
  }

  setDataToCollection(UserApp userApp) async {
    final usersRef = FirebaseFirestore.instance.collection('users').withConverter<UserApp>(
      fromFirestore: (snapshot, _) => UserApp.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
    
    await usersRef.add(
      UserApp(
        uid: userApp.uid,
        username: userApp.username,
        fullname: userApp.fullname,
        birthday: userApp.birthday,
        email: userApp.email,
        photoURL: userApp.photoURL,
        telephone: userApp.telephone,
      ),
    );

  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signInWithCredentials(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signInWithCredentials(authCreds);
  }

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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

  // returns true if is empty
  Future<bool> checkUsername(String username) async {
    var data = FirebaseFirestore.instance.collection("users").where('username', isEqualTo: username).get();

    return await data.asStream().isEmpty;
  }

  Future<String> getTelephoneInCollection(User? user) async{
    /*final usersRef = FirebaseFirestore.instance.collection('users').withConverter<UserApp>(
      fromFirestore: (snapshot, _) => UserApp.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );*/

    String telephoneNumber = "";


    List<Map<dynamic,dynamic>> listUser = await FirebaseFirestore.instance.collection('users')
      .where('uid', isEqualTo: user?.uid)
      .get()
      .then((snapshot) => snapshot.docs.map((doc) => doc.data() ).toList());

    if(listUser.length == 1){
      return listUser.first['telephone'];
    }

    return "";
  }
}