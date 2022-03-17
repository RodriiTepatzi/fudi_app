import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/services/cart_service.dart';

class CartController {

  CartController._privateConstructor();
  static final CartController _instance = CartController._privateConstructor();
  static CartController get instance => _instance;
  late Cart cart;

  void initializeCart(String userId) async{
    cart = await CartService().getCart(userId);
  }

  Future<Cart> getCart(String userId) async{
    return cart;
  }

  static void deleteOrderInCart(String orderId) async{

  }
}