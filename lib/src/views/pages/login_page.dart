// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/forms/login_form.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      )
    );

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const Image(
                      // Make this server-side later for changing it using NetworkImage(url)
                      image: AssetImage('assets/images/food_slide1.jpg'),
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      child: backButtonTransparent(context, Colors.white),
                    )
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0.0, -20.0),
                  child: IntrinsicHeight(
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,  
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                        child: Center(
                          child: Column(
                            children: [
                              const Text(
                                'Bienvenido de vuelta',
                                style: TextStyle(
                                  color: accentColorApp,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                              const Text(
                                'Inicia sesión',
                                style: TextStyle(
                                  color: accentColorApp,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: formFieldHeightGap),
                              const LoginForm(
                                key: ValueKey('login-form'),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, 'forgot-password');
                                      },
                                      child: const Text(
                                        '¿Olvidó su contraseña?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '¿No tiene una cuenta? ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, 'sign-up');
                                      },
                                      child: Text(
                                        'Registrate.',
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
