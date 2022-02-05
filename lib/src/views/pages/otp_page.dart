import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/forms/otp_code_form.dart';
import 'package:fudi_app/src/views/widgets/header.dart';

class OTPPage extends StatelessWidget {
  final User? user;
  const OTPPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(marginWidget),
            child: const Text(
              'Verificar número',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(marginWidget),
            child: const Text(
              'Introduce el código que ha sido enviado al número +522462192777',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: OTPCodeForm()
              ),
            ],
          ),
        ],
      ),
    );
  }
}