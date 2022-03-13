import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/models/restaurant.dart';

class OrderItem{
  RestaurantModel restaurant;
  List<OrderProduct> products;
  String id;
  OrderItem(this.restaurant, this.products, this.id);
}