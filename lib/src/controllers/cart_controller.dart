import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/services/cart_service.dart';

class CartController {
  Future<Cart> getCart(String userId) async{
    return await CartService().GetCart(userId);
  }
}