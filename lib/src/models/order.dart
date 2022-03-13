import 'package:fudi_app/src/models/order_item.dart';

class Order{
  String id;
  String userId;
  String deliverId;     
  String restaurantId;
  List<OrderItem> orderItems;
  double total;
  String orderStatus;
  
  Order(
    this.id,
    this.userId,
    this.deliverId,
    this.restaurantId,
    this.orderItems,
    this.total,
    this.orderStatus
  );
}