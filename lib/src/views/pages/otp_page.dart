import 'package:flutter/material.dart';
import 'package:fudi_app/src/views/forms/otp_code_form.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OTPCodeForm(),
    );
  }
}