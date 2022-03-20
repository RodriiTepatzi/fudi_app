import 'package:flutter/cupertino.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/services/cart_service.dart';

class CartController with ChangeNotifier{

  CartController._privateConstructor();
  static final CartController _instance = CartController._privateConstructor();
  static CartController get instance => _instance;
  Cart cart = Cart(uid: "", total: 0, openedDate: DateTime.now(), closedDate: DateTime.now(), orders: [] );

  void initializeCart(String userId) async{
    cart = await CartService().getCartAsync(userId);
    notifyListeners();
  }

  void deleteOrderInCart(String orderId){
    cart.orders.removeWhere((element) => element.id == orderId);
    notifyListeners();
  }

   void addOrder(String userId, Order order){
    cart.orders.add(order);
    CartService().addOrderAsync(userId, order);
    notifyListeners();
  }

  @override
  void notifyListeners();
}