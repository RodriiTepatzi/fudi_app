import 'package:flutter_svg/svg.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_item.dart';
import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';


class CartPreview extends StatefulWidget {
  Cart cart;
  CartPreview({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartPreview> createState() => _CartPreviewState();
}

class _CartPreviewState extends State<CartPreview> {
  late Cart _cart = widget.cart;

  @override
  void initState() {
    _cart = widget.cart;
    super.initState();    
  }

  void _removeOrder(String orderId){
    setState(() {
      _cart.orders.removeWhere((element) => element.id == orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...generateCartPreview(context, _cart)
      ],
    );
  }

  List<Widget> generateCartPreview(BuildContext context, Cart cart){
    List<Widget> widgets = [];
    for (Order order in cart.orders) {
      widgets.add(orderPreview(context, order));
    }
    return widgets;
  }

  Widget orderPreview(BuildContext context,Order order){
    return Container(
      decoration: BoxDecoration(
        color: bgCardApp,
        borderRadius: BorderRadius.circular(roundedCornersValue),
        boxShadow: [ 
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(marginWidget),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(marginWidget),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "id: ${order.id}",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      order.orderStatus,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...orderItemsPreview(order.orderItems),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(marginWidget),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _removeOrder(order.id),
                  child:  SvgPicture.asset(
                    'assets/icons/trash.svg',
                    width: 25,
                    height: 25,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  "Total: \$${buildTotalProducts(order.orderItems)}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> orderItemsPreview(List<OrderItem> orderItems){
    List<Widget> widgets = [];
    for (var orderItem in orderItems) {
      widgets.add(
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(roundedCornersValue),
                    child: Image(
                      width: 40,
                      height: 40,
                      image: NetworkImage(orderItem.restaurant.restaurantUrl),             
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderItem.restaurant.restaurantName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: marginWidget/2),
                          padding: const EdgeInsets.all(marginWidget/2),
                          decoration: BoxDecoration(
                            color: accentColorApp,
                            borderRadius: BorderRadius.circular(roundedCornersValue),
                          ),
                          child: Text(
                            orderItem.restaurant.status,
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ...generateProductsPreview(orderItem.products),

            ],
          ),
        ),
      );
    }
    return widgets;
  }

  List<Widget> generateProductsPreview(List<OrderProduct> products){
    List<Widget> widgets = [];

    for (var product in products) {
      widgets.add(
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: Row(
            children: [
              SizedBox(
                child: Text(
                  "${product.quantity.toString()}x",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: marginWidget),
                child: Text(
                  product.product.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                child: Text(
                  "\$${product.product.productPrice.toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }

  String buildTotalProducts(List<OrderItem> orderItems){
    double total = 0;
    for (var orderItem in orderItems) {
      for (var product in orderItem.products) {
        total += product.product.productPrice * product.quantity;
      }
    }

    return total.toString();
  }
}

