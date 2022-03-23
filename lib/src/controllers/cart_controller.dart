import 'package:flutter/cupertino.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/services/cart_service.dart';

class CartController with ChangeNotifier{

  CartController._privateConstructor();
  static final CartController _instance = CartController._privateConstructor();
  static CartController get instance => _instance;
  Cart cart = Cart(uid: "", total: 0, openedDate: DateTime.now(), closedDate: DateTime.now(), orders: [] );
  String _userId = "";

  void initializeCart(String userId) async{
    cart = await CartService().getCartAsync(userId);
    _userId = userId;
    notifyListeners();
  }

  void deleteOrderInCart(String restaurantId) async{
    cart.orders.removeWhere((element) => element.restaurantId == restaurantId);
    CartService().deleteOrderAsync(_userId, restaurantId);
    notifyListeners();
  }

  void addOrder(String userId, String restaurantId, Order orderT){
    CartService _service = CartService();
    List<Order> orders = cart.orders.where((element) => element.restaurantId == orderT.restaurantId).toList();
    List<OrderProduct> orderProductsToAdd = [];
    if(orders.isNotEmpty){
      // We iterate over the order with same id as restaurant in our order parameter.
      for (var order in orders) {

        if(order.restaurantId == order.restaurantId){

          // We iterate now to check if it has items or not.
          if(order.orderItems.isNotEmpty){

            for(var orderItem in order.orderItems){

              // We check if products are not empty
              // If its empty then we just add the product.
              if(orderItem.products.isNotEmpty){

                // If products exist we check that if its the same we just increase quantity.
                // Otherwise we add the new product.
                List<OrderProduct> orderChecker = orderItem
                  .products
                  .where((element) => element.product.productId == orderT.orderItems[0].products[0].product.productId)
                  .toList();
                if(orderChecker.isNotEmpty){
                  orderChecker[0].quantity += orderT.orderItems[0].products[0].quantity;
                  _service.updateItemQuantity(userId, restaurantId, orderChecker[0]);
                }
                else{
                  orderProductsToAdd.add(orderT.orderItems[0].products[0]);
                  _service.addItemToOrderAsync(userId, restaurantId, orderT.orderItems[0].products[0]);
                }

                orderItem.products.addAll(orderProductsToAdd);
              }
              else{
                // Add product on empty products list.
                orderProductsToAdd.add(orderT.orderItems[0].products[0]);
                _service.addItemToOrderAsync(userId, restaurantId, orderT.orderItems[0].products[0]);
              }
            }
          }
        }
      }
      notifyListeners();
    }
    else{
      cart.orders.add(orderT);
      _service.addOrderAsync(userId, orderT);
      notifyListeners();
    }
  }

  @override
  void notifyListeners();
}