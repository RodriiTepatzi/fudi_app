import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/forms/otp_code_form.dart';
import 'package:fudi_app/src/views/widgets/header.dart';

class OTPPage extends StatefulWidget {
  final User? user;
  OTPPage({Key? key, this.user}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    //AuthService.signOut();
    getTelephone();
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
            child: Text(
              'Introduce el código que ha sido enviado al número ' + phoneNumber,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
                child: phoneNumber.isNotEmpty ? OTPCodeForm(phoneNumber) : Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getTelephone() async{
    String phone = "";
    await UserService().fetchUser(widget.user!.uid).then((value) => phone = value.telephone);
    setState(() {
      phoneNumber = phone;
    });
  }
}
