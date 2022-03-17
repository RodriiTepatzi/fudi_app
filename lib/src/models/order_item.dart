import 'dart:convert';

import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/models/restaurant.dart';

class OrderItem{
  RestaurantModel restaurant;
  List<OrderProduct> products;
  String id;
  OrderItem({
    required this.restaurant, 
    required this.products, 
    required this.id
  });

  
  OrderItem.fromJson(Map<String, dynamic> json) : this(
    restaurant : RestaurantModel.fromJson(json['restaurant']),
    products: _parseJsonToList(json['products']),
    id : json['id'],
  );

  Map<String, dynamic> toJson(){
    return {
      "restaurant" : restaurant.toJson(),
      "products" : jsonEncode(products),
      "id" : id,
    };
  }

  static List<OrderProduct> _parseJsonToList(List<dynamic> json){
    List<OrderProduct> itemsList = List<OrderProduct>.from(json.map((i) => OrderProduct.fromJson(i)));

    return itemsList;
  }
}