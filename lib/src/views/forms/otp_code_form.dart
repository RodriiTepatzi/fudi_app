// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fudi_app/src/views/pages/tabs_page.dart';

class OTPCodeForm extends StatefulWidget {

  final String phoneNumber;
  OTPCodeForm(this.phoneNumber);

  @override
  _OTPCodeFormState createState() => _OTPCodeFormState();
}

class _OTPCodeFormState extends State<OTPCodeForm> {

  late String phoneNo = widget.phoneNumber, verificationId, smsCode, code;
  bool codeSent = false;

  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context){

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential){
        FirebaseAuth.instance.currentUser?.updatePhoneNumber(credential);
        AuthService.handleAuth(context);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        FirebaseAuth.instance.currentUser?.updatePhoneNumber(credential);
        AuthService.handleAuth(context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
    );

    return Scaffold(
      body: SizedBox(
        child: OtpTextField(
          numberOfFields: 6,
          fieldWidth: 40,
          margin: const EdgeInsets.all(marginWidget),
          cursorColor: accentColorApp,
          borderColor: accentColorApp,
          focusedBorderColor: accentColorApp,
          showFieldAsBox: true, 
          autoFocus: true,
          onCodeChanged: (String code) {
            setState(() {
              smsCode = code;  
            });
          },
          onSubmit: (String verificationCode) {
            smsCode = verificationCode;

            User? user = FirebaseAuth.instance.currentUser;

            if(user != null){
              if(user.phoneNumber != null){
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => TabsPage()
                  ), 
                 ModalRoute.withName("/")
                );
              }
              else{
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                FirebaseAuth.instance.currentUser?.updatePhoneNumber(credential);
                AuthService.handleAuth(context);
              }
            }
            else{
              
            }
          },
        ),
      ),
    );
  }
}