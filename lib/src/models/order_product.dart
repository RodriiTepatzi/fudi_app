import 'package:fudi_app/src/models/product.dart';

class OrderProduct{
  Product product;
  int quantity;

  OrderProduct({
    required this.product,
    required this.quantity,
  });

  OrderProduct.fromJson(Map<String, dynamic> json) : this(
    product : Product.fromJson(json['product']),
    quantity : json['quantity'],
  );

  Map<String, dynamic> toJson(){
    return {
      'product' : product.toJson(),
      'quantity' : quantity,
    };
  }

}