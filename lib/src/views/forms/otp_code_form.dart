// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPCodeForm extends StatefulWidget {

  final String phoneNumber;
  OTPCodeForm(this.phoneNumber);

  @override
  _OTPCodeFormState createState() => _OTPCodeFormState();
}

class _OTPCodeFormState extends State<OTPCodeForm> {

  late String phoneNo = widget.phoneNumber;    
  late String smsCode;    
  late String verificationId;    
  String errorMessage = '';   
  final _auth = FirebaseAuth.instance;   

  final formKey = GlobalKey<FormState>();

  Future<void> verifyPhone() async{
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential){
        _auth.currentUser?.linkWithCredential(credential);
        AuthService.handleAuth(context);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        _auth.currentUser?.linkWithCredential(credential);
        AuthService.handleAuth(context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
    );
  }

  @override
  Widget build(BuildContext context){
    //AuthService.signOut();

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
            
          },
          onSubmit: (String verificationCode) {
            setState(() {
              smsCode = verificationCode;
            });
            verifyPhone();
            User? user = _auth.currentUser;
            if(user != null){
              AuthService.handleAuth(context);
            }
          },
        ),
      ),
    );
  }
}