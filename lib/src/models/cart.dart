import 'dart:convert';

import 'package:fudi_app/src/controllers/cart_controller.dart';
import 'package:fudi_app/src/models/order.dart';

class Cart {
  
  String uid;
  int total;
  DateTime openedDate;
  DateTime closedDate;
  List<Order> orders;
  Cart({
    required this.uid,
    required this.total,
    required this.openedDate,
    required this.closedDate,
    required this.orders,
  });

  Cart.fromJson(Map<String, dynamic> json)
    : this(
      uid: json['uid'],
      total: json['total'],
      openedDate: DateTime.parse(json['openedDate']),
      closedDate: DateTime.parse(json['closedDate']),
      orders: _parseJsonToList(json['orders']),
  );

  Map<String, dynamic> toJson(){
    return{
      "uid" : uid,
      "total" : total,
      "openedDate" : openedDate.toIso8601String(),
      "closedDate" : closedDate.toIso8601String(),
      "orders" : jsonEncode(orders),
    };
  }

  static List<Order> _parseJsonToList(List<dynamic> json){
    List<Order> itemsList = List<Order>.from(json.map((i) => Order.fromJson(i)));

    return itemsList;
  }

  void deleteOrder(String uid){
    CartController.instance.deleteOrderInCart(uid);
  }

  void addOrder(Order order){
    orders.add(order);
  }
}