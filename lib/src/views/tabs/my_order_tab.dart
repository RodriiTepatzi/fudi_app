// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class MyOrderTab extends StatefulWidget {
  MyOrderTab({Key? key}) : super(key: key);

  @override
  _MyOrderTabState createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Orders'),
    );
  }
}