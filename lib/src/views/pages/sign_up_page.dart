// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/views/forms/sign_up_form.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';

class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: bgApp,
      )
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgApp,
        elevation: 0.0,
        leading: Builder( 
          builder: (BuildContext context){
            return backButtonTransparent(context, Colors.black);
          }
        ),
      ),
      body: ListView(
        children: [
          Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Crear una cuenta.',
                  style: TextStyle(
                    color: textColorApp,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                const SizedBox(height: heightFormFieldValue,),
                const SignUpForm(
                  key: ValueKey('sign-up-form'),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: const Text(
                      'Al registrarte indicas que aceptas nuestros terminos y condiciones.',
                      style: TextStyle(
                        fontSize: 14.0,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
