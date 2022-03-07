import 'package:fudi_app/src/models/product.dart';

class OrderProduct{
  Product product;
  int quantity;

  OrderProduct(
    this.product,
    this.quantity,
  );
}