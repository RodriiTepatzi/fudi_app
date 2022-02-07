import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/order_status.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/pages/map_view.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';

class OrderPageController{

  double total = 0;
  double totalRestaurant = 0;

  Widget getWidgetByStatus(BuildContext context, Order order){
    if(order.orderStatus == orderCompleted){
      return orderCompletedOrCanceledView(context, order);
    }
    else if(order.orderStatus == orderCanceled){
      return orderCompletedOrCanceledView(context, order);
    }
    else if(order.orderStatus == orderPreparing){
      return preparingOrderView();
    }

    return Container();
  }

  Widget preparingOrderView(){
    return MapView();
  }

  Widget orderCompletedOrCanceledView(BuildContext context, Order order){
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
          ...getRestaurants(context, order),
          Container(
            margin: const EdgeInsets.all(marginWidget),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(roundedCornersValue),
            ),
            child: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(marginWidget),
              child: Text(
                "Total: MXN \$" + total.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getProducts(BuildContext context, List<OrderProduct> products){
    List<Widget> widgets = [];

    for (var item in products) {
      total += item.product.productPrice * item.quantity;
      totalRestaurant += item.product.productPrice * item.quantity;

      widgets.add(
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(marginWidget),              
                  alignment: Alignment.centerLeft,
                  width: (MediaQuery.of(context).size.width - 80) / 3,
                  child: Text(
                    item.product.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(marginWidget),
                  child: Text(
                    "\$" + item.product.productPrice.toString() + "x" + item.quantity.toString(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(marginWidget),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "\$" + (item.quantity * item.product.productPrice).toString(),
                  ),
                ),
              ],
            ),
          ],
        )
      );
    }

    return widgets;
  }

  List<Widget> getRestaurants(BuildContext context, Order order){
    
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
                margin: const EdgeInsets.only(top: marginWidget, left: marginWidget, right: marginWidget),
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
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          ...getProducts(context, item.products),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(marginWidget),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "MXN \$" + totalRestaurant.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      totalRestaurant = 0;
    }
    return widgets;
  }
}
