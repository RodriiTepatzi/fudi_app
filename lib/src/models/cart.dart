import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_item.dart';

class Cart {
  
  String uid;
  int total;
  DateTime openedDate;
  DateTime closedDate;
  List<Order> orders;

  Cart(
    this.uid,
    this.total,
    this.openedDate,
    this.closedDate,
    this.orders,
  );

  /*addItemToCart(Order order){
    orders.add(order);
  }*/
}