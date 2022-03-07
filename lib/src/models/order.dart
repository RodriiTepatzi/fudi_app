import 'package:fudi_app/src/models/order_item.dart';

class Order{
  int id; 
  int userId;
  int deliverId;
  List<OrderItem> orderItem;
  String total;
  String orderStatus;
  
  Order(
    this.id,
    this.userId,
    this.deliverId,
    this.orderStatus,
    this.orderItem,
    this.total,
  );
}