// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fudi_app/src/forms/sign_up_form.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/widgets/back_button.dart';

class SignUpPage extends StatelessWidget {

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
          Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Crear una cuenta.',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
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

Widget _usernameInput(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: bgInputsApp,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Nombre de usuario',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _emailInput(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: textFieldColorApp,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
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

Widget _phoneInput(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: textFieldColorApp,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Número de telefono',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _dateOfBirthInput(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: textFieldColorApp,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _passwordInput(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: textFieldColorApp,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _signUpButton(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(top: 40),
    height: 45.0,
    child: RaisedButton(
      onPressed: (){
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Registrarte',
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