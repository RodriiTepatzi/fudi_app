// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fudi_app/src/views/login_page.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

class WelcomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
              )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), 
              child: Container(
                color: Colors.black.withOpacity(0.8)
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: const Text(
                  'Entrega de comida a tú puerta.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
                child: const Text(
                  'Encuentra el lugar más cercano a ti.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                height: 45.0,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage()
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(roundedCornersValue),
                  ),
                  color: Theme.of(context).accentColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      /*Image(
                        image: AssetImage('../assets/facebook.png'),
                      ),*/ // This in case an image will be added later...
                      Text(
                        'Entrar con número de telefono',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                height: 45.0,
                child: RaisedButton(
                  onPressed: (){
                    
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(roundedCornersValue),
                  ),
                  color: Theme.of(context).buttonColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/facebook.png'),
                        width: 25,
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: const Text(
                          'Entrar con Facebook',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}