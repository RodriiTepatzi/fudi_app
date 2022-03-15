import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/controllers/otp_controller.dart';
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
  User? _user = FirebaseAuth.instance.currentUser;
  final OTPController _otpController = OTPController(FirebaseAuth.instance.currentUser);
  String phoneNumber = "";
  bool _dataSet = false;
  bool _isCorrect = false;

  @override
  void initState() {
    _dataSet = false;
    _isCorrect = false;
    phoneNumber = "";
    super.initState();
  }

  void setPhonenumber() async{
    if(!_dataSet){
      this.phoneNumber = await _otpController.getUserPhonenumber();
      if(phoneNumber != "Usuario no encontrado." && phoneNumber != "Error-117." && phoneNumber.isNotEmpty){
        setState(() {
          _isCorrect = true;  
        });
      }
      setState(() {
        _dataSet = true;  
      });
    } 
  }

  

  @override
  Widget build(BuildContext context) {
    setPhonenumber();
    if(_dataSet && _isCorrect){
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
                child: OTPCodeForm(phoneNumber),
              ),
            ],
          ),
        ],
      ),
    );
    }
    else{
      return Container(
        color: Colors.white,
      );
    }
  }
}
