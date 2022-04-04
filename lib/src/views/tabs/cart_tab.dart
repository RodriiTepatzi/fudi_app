// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fudi_app/src/controllers/cart_controller.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudi_app/src/views/widgets/cart_preview.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartTab extends StatefulWidget {
  UserApp? userApp;
  CartTab({Key? key, required this.userApp}) : super(key: key);

  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final doubleFormater = NumberFormat("#####.00");
  bool carIsSet = false;

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Consumer<CartController>(
      builder: (context, data, child){
        return Column(
          children: [
            Container(
                  alignment: Alignment.topLeft,
                  height: 60,
                  padding: EdgeInsets.only(top: marginWidget*2, bottom: marginWidget, left: marginWidget),
                  child: Text(
                    'Carrito',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 185,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      CartPreview(cart: data.cart),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: marginWidget),
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        "Total: \$${getTotalCart(data.cart)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: marginWidget),
                          padding: const EdgeInsets.only(left: marginWidget * 2, right: marginWidget * 2),
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                            color: accentColorApp,
                            borderRadius: BorderRadius.circular(roundedCornersValue),
                          ),
                          child: const Text(
                            "Pagar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }
    );
    
    /*if(cart != null){
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 60,
          padding: EdgeInsets.only(top: marginWidget*2, bottom: marginWidget, left: marginWidget),
          child: Text(
            'Carrito',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 185,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              CartPreview(cart: cart!),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: marginWidget),
          height: 50,
          child: Row(
            children: [
              Text(
                "Total: \$${getTotalCart()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: marginWidget),
                  padding: const EdgeInsets.only(left: marginWidget * 2, right: marginWidget * 2),
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: accentColorApp,
                    borderRadius: BorderRadius.circular(roundedCornersValue),
                  ),
                  child: const Text(
                    "Pagar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
    }
    else{
      return Container();
    }*/
  }

  String getTotalCart(Cart cartData){
    double total = 0;
    for (var order in cartData.orders){
      for (var orderItem in order.orderItems) {
        for (var product in orderItem.products) {
          total += product.product.productPrice * product.quantity;
        }
      }
    }
    return doubleFormater.format(total);
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
}

