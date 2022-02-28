// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrderTab extends StatefulWidget {
  MyOrderTab({Key? key}) : super(key: key);

  

  @override
  _MyOrderTabState createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {

  //List<Order> orders = [getSingleOrder()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 60,
          padding: EdgeInsets.only(top: marginWidget*2, bottom: marginWidget, left: marginWidget),
          child: Text(
            'Mis ordenes',
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
              //...getOrderCards(getOrders()),
            ],
          ),
        )
      ],
    );
  }
  
  Widget emptyOrders(){
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/sad_face.svg',
            width: 65,
            height: 65,
            color: Colors.black26,
          ),
          Container(
            margin: const EdgeInsets.all(marginWidget),
            child: Text(
              'Aún no tiene ninguna orden.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black26,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getOrderCards(List<Order> orders){

    List<Widget> widgets = []; 

    if(orders.isEmpty){
      return [emptyOrders()];
    }

    for (var item in orders) {
      widgets.add(OrderCard(context, item));
    }

    return widgets;
  }

}

