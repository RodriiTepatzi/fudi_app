import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/order_status.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';

class OrderPageController{

  int total = 0;

  Widget getWidgetByStatus(Order order){
    if(order.orderStatus == orderCompleted){
      return orderCompletedOrCanceledView(order);
    }
    else if(order.orderStatus == orderCanceled){
      return orderCompletedOrCanceledView(order);
    }

    return Container();
  }

  Widget orderCompletedOrCanceledView(Order order){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgApp,
        elevation: 0.0,
        leading: Builder( 
          builder: (BuildContext context){
            return backButtonTransparent(context, Colors.black);
          }
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(marginWidget),
            child: Text(
              order.orderStatus,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...getRestaurants(order),
          Container(
            margin: const EdgeInsets.all(marginWidget),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(roundedCornersValue),
            ),
            child: Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Text(
                "Total" + total.toString(),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getProducts(List<OrderProduct> products){
    List<Widget> widgets = [];
    for (var item in products) {
      
    }

    return [];
  }

  List<Widget> getRestaurants(Order order){
    
    List<Widget> widgets = [];

    for (var item in order.orderItem) {
      widgets.add(
        Container(
          margin: const EdgeInsets.all(marginWidget),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(roundedCornersValue),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(marginWidget),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(roundedCornersValue),
                          child: Image(
                            width: 40,
                            height: 40,
                            image: NetworkImage(item.restaurant.restaurantUrl),             
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: marginWidget),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.restaurant.restaurantName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: marginWidget),
                      decoration: BoxDecoration(
                        color: bgApp,
                        borderRadius: BorderRadius.circular(roundedCornersValue),
                      ),
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              "aaa"
                            ),
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
      );
    }
    return widgets;
  }
}
