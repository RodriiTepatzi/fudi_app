// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/views/forms/forgot_password_form.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/alert_dialog.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';
import 'package:fudi_app/src/views/widgets/header.dart';
import 'package:fudi_app/src/services/extensions.dart';

class ForgotPasswordPage extends StatelessWidget {

  String emailValue = "";
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
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Center(
              child: 
              Column(
                children: [
                  Container(
                    child: Text(
                      'Recuperar contraseña',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      'Introduzca su correo electronico. Recibirá un enlace para crear una nueva contraseña.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          children: const [
                            ForgotPasswordForm(
                              key: ValueKey('forgot-password-form'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}