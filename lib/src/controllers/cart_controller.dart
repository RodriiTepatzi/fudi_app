import 'package:flutter/cupertino.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_item.dart';
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

  void addOrder(String userId, Order orderT){
    List<Order> orders = cart.orders.where((element) => element.restaurantId == orderT.restaurantId).toList();

    if(orders.isNotEmpty){
      // We iterate over the order with same id as restaurant in our order parameter.
      for (var order in orders) {

        if(order.restaurantId == order.restaurantId){

          // We iterate now to check if it has items or not.
          for(var orderItem in order.orderItems){

            // We check if products are not empty
            // If its empty then we just add the product.
            if(orderItem.products.isNotEmpty){

              // If products exist we check that if its the same we just increase quantity.
              // Otherwise we add the new product.
              for(var orderProduct in orderItem.products){
                if(orderProduct.product.productId == orderT.orderItems[0].products[0].product.productId){
                  orderProduct.quantity += orderT.orderItems[0].products[0].quantity; 
                  // Increase quantity only.
                }
                else{
                  // Add product on not same item.
                  orderItem.products.add(orderT.orderItems[0].products[0]);
                }
              }
            }
            else{
              // Add product on empty products list.
              orderItem.products.add(orderT.orderItems[0].products[0]);
            }
          }
        }
      }
      notifyListeners();
    }
    else{
      cart.orders.add(orderT);
      CartService().addOrderAsync(userId, orderT);
      notifyListeners();
    }
  }

  void deleteOrder(String userId, Order orderT) {
    
  }

  @override
  void notifyListeners();
}