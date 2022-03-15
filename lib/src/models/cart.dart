import 'dart:convert';

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

  static List<Order> _parseJsonToList(List<dynamic> json){
    List<Order> orders = [];
    List<Order> itemsList = List<Order>.from(json.map((i) => Order.fromJson(i)));

    return itemsList;
  }
}