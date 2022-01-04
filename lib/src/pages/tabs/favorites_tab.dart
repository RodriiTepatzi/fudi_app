// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class FavoritesTab extends StatefulWidget {
  FavoritesTab({Key? key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Favoritos'),
    );
  }
}