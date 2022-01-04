// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/widgets/alert_dialog.dart';
import 'package:fudi_app/src/widgets/back_button.dart';
import 'package:fudi_app/src/widgets/header.dart';
import 'package:fudi_app/src/services/extensions.dart';

class ForgotPasswordPage extends StatelessWidget {

  String emailValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder( 
          builder: (BuildContext context){
            return backButton(context, Colors.black);
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
                          children: [
                            _emailInput(),
                            _buttonRecover(context),
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
  Widget _emailInput(){
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: textFieldColorApp,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextFormField(
        autovalidate: true,
        validator: (input) => input.toString().isValidEmail() ? null : "Email no valido.",
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buttonRecover(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 45.0,
      child: RaisedButton(
        onPressed: (){
          if(!emailValue.contains('@') || !emailValue.contains('.')){

          }
          Navigator.pushNamed(context, 'login');
          showAlertDialog(context, Icons.mark_email_read,
            'Email enviado', 
            'El correo de recuperación ha sido enviado. Revise su bandeja de entrada o su carpeta de \'spam\'.', 
            'Aceptar');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Theme.of(context).accentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            /*Image(
              image: AssetImage('../assets/facebook.png'),
            ),*/ // This in case an image will be added later...
            Text(
              'Recuperar contraseña',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void forgotPasswordAction(BuildContext context){

  
  Navigator.pop(context);
}