// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

class FavoritesTab extends StatefulWidget {
  FavoritesTab({Key? key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 60,
          padding: const EdgeInsets.only(top: marginWidget*2, bottom: marginWidget, left: marginWidget),
          child: const Text(
            'Favoritos',
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
            children: const [
              SizedBox()
            ],
          ),
        )
      ],
    );
  }
}