import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/controllers/otp_controller.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/forms/otp_code_form.dart';

class OTPPage extends StatefulWidget {
  final User? user;
  const OTPPage({Key? key, this.user}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  // We create a new instace of our OTPController passing the firebaseauth instance as parameter.
  final OTPController _otpController = OTPController(FirebaseAuth.instance.currentUser);

  // This variable is used when user edits otp field.
  String phoneNumber = "";

  // Variable to check when the user is logged and we got the data from the API.  True when is done.
  bool _dataSet = false;

  // Variable to check if when setting the phonenumber is completed successfully or not.
  bool _isCorrect = false;

  // InitState method.
  @override
  void initState() {
    // We initialize variables.
    _dataSet = false;
    _isCorrect = false;
    phoneNumber = "";
    super.initState();
  }

  // Method when we init the page.
  void setPhonenumber() async{

    // If _dataSet is false we try to get data from API.
    if(!_dataSet){
      // We use our OTPController. And we make a call to get the phonenumber that was registered when registering.
      phoneNumber = await _otpController.getUserPhonenumber();
      
      // We check that the phonenumber didnt return an error.
      if(phoneNumber != "Usuario no encontrado." && phoneNumber != "Error-117." && phoneNumber.isNotEmpty){
        setState(() {
          // If data is not an error message then we set to correct.
          _isCorrect = true;
        });
      }
      setState(() {
          // However if data is not.
        _dataSet = true;  
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    // We make the call to get the phonenumber
    setPhonenumber();

    // If the data was success then we render the otp form.
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
    else{ // If not we show an error message.
      return Container(
        color: Colors.white,
      );
    }
  }
}
