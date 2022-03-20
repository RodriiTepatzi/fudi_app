import 'dart:convert';

import 'package:fudi_app/src/models/order_item.dart';

class Order{
  String id;
  String userId;
  String deliverId;     
  String restaurantId;
  List<OrderItem> orderItems;
  double total;
  String orderStatus;
  
  Order({
    required this.id,
    required this.userId,
    required this.deliverId,
    required this.restaurantId,
    required this.orderItems,
    required this.total,
    required this.orderStatus
  });

  Order.fromJson(Map<String, dynamic> json) : this(
    id: json['id'],
    userId: json['userId'],
    deliverId : json['deliverId'],
    restaurantId : json['restaurantId'],
    orderItems : _parseJsonToList(json['orderItems']),
    total: json['total'],
    orderStatus : json['orderStatus']
  );

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'userId' : userId,
      'deliverId' : deliverId,
      'restaurantId' : restaurantId,
      'orderItems' : json.encode(orderItems),
      'total' : total,
      'orderStatus' : orderStatus
    };
  }

  static List<OrderItem> _parseJsonToList(List<dynamic> json){
    List<OrderItem> itemsList = List<OrderItem>.from(json.map((i) => OrderItem.fromJson(i)));

    return itemsList;
  }
}