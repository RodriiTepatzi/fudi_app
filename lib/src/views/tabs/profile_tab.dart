// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  @override
  Widget build(BuildContext context) {

    //AuthService().signOut();
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 60,
          padding: EdgeInsets.only(top: marginWidget*2, bottom: marginWidget, left: marginWidget),
          child: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 120,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(marginWidget),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(roundedCornersValue),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(marginWidget),
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(roundedCornersValue),
                        child: Image(
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=399&q=80"),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Marco Rodrigo Flores Tepatzi",
                      ),
                    ),
                    GestureDetector(
                      //onTap: AuthService().signOut(),
                      child: Container(
                        child: Text(
                          "Salir"
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}