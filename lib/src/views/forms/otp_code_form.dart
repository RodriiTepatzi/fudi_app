import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OTPCodeForm extends StatefulWidget {
  @override
  _OTPCodeFormState createState() => _OTPCodeFormState();
}

class _OTPCodeFormState extends State<OTPCodeForm> {

  final formKey = new GlobalKey<FormState>();
  late String code;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        child: OtpTextField(
          numberOfFields: 5,
          fieldWidth: 40,
          margin: const EdgeInsets.all(marginWidget),
          cursorColor: accentColorApp,
          borderColor: accentColorApp,
          focusedBorderColor: accentColorApp,
          showFieldAsBox: true, 
          autoFocus: true,
          onCodeChanged: (String code) {
            this.code = code;
          },
          onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
          },
        ),
      ),
    );
  }
}