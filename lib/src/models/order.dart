import 'package:fudi_app/src/models/order_item.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';

class Order{
  int id; 
  int userId;
  int deliverId;
  List<OrderItem> orderItem;
  String total;
  String orderStatus;
  DateTime dateCreated;
  DateTime dateDone; 
  
  Order(
    this.id,
    this.userId,
    this.deliverId,
    this.orderStatus,
    this.orderItem,
    this.total,
    this.dateCreated,
    this.dateDone,
  );
}