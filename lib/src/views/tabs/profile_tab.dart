// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fudi_app/src/controllers/profile_controller.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

class ProfileTab extends StatefulWidget {
  UserApp? userApp;
  ProfileTab({Key? key, required this.userApp}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late final ProfileController _profileController = ProfileController(widget.userApp);

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 60,
          padding: EdgeInsets.only(top: marginWidget*2, left: marginWidget),
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
          height: MediaQuery.of(context).size.height - 135,
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
                        borderRadius: BorderRadius.circular(100),
                        child: _profileController.getURLProfileImage().isNotEmpty ? Image(width: 100, height: 100, fit: BoxFit.cover, image: NetworkImage(_profileController.getURLProfileImage())) : 
                          Image(width: 100, height: 100, fit: BoxFit.cover, image: AssetImage("assets/images/user.png"))
                      ),
                    ),
                    Container(
                      child: Text(
                        _profileController.getFullName(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(marginWidget / 2),
                      child: Text(
                        _profileController.getEmail(),
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        _profileController.getTelephone(),
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: const EdgeInsets.only(top: marginWidget, bottom: marginWidget),
                        padding: const EdgeInsets.all(marginWidget),
                        decoration: BoxDecoration(
                          color: accentColorApp,
                          borderRadius: BorderRadius.circular(roundedCornersValue)
                        ),
                        child: Text(
                          "Editar perfil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: marginWidget, right: marginWidget),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(roundedCornersValue),
                        ),
                        child: Row(
                          children:  [
                            Container(
                              margin: const EdgeInsets.all(marginWidget),
                              child: Text(
                                "Ordenes",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        AuthService.signOut();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: marginWidget),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(roundedCornersValue),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(marginWidget),
                              child: Text(
                                "Salir",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
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