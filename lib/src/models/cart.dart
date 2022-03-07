import 'package:fudi_app/src/models/order.dart';

class Cart {
  String uid;
  List<Order> orders;
  String total;
  String openedDate;
  String closedDate;

  Cart(
    this.uid,
    this.orders,
    this.total,
    this.openedDate,
    this.closedDate
  );

  addItemToCart(Order order){
    orders.add(order);
  }
}