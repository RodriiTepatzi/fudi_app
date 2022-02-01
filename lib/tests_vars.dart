import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/order_item.dart';
import 'package:fudi_app/src/models/order_product.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';

import 'src/models/order.dart';

  RestaurantModel restaurantModel = RestaurantModel(restaurantName: "Restaurant test", 
    restaurantAddress: "Restaurant address test", 
    restaurantSlogan: "Restaurant slogan test", 
    restaurantUrl: "https://images.unsplash.com/photo-1554679665-f5537f187268?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", 
    stars: "5.0", cost: "\$\$\$", category: "Here goes category",
    status: "Abierto"
  );

  Product productModel = Product(
      "Pizza",
      "La mejor pizza de todas",
      15.0,
      "https://media.istockphoto.com/photos/hot-dogs-for-game-day-picture-id1326146573?b=1&k=20&m=1326146573&s=170667a&w=0&h=QUezIIx1Bi91E9A4dRdaBJMjHNCGjb3GliyfrkDPHqE=",
      "5.0",
      "117",
      ["Tomate", "Cheese", "Pepperonni"],
      "pz."
  );

  OrderProduct orderProduct = OrderProduct(productModel, 2);

  OrderItem orderItem = OrderItem(restaurantModel, [orderProduct, orderProduct]);

  Order orderModel = Order(
    11111111111,
    1,
    1,
    "Completado",
    [orderItem, orderItem],
    "115",
    DateTime.now(),
    DateTime.now()
  );

  Order orderModel2 = Order(
    11111111112,
    1,
    1,
    "Preparando",
    [orderItem, orderItem],
    "115",
    DateTime.now(),
    DateTime.now()
  );

  Order orderModel3 = Order(
    11111111113,
    1,
    1,
    "Cancelado",
    [orderItem, orderItem],
    "115",
    DateTime.now(),
    DateTime.now()
  );

  Order orderModel4 = Order(
    11111111112,
    1,
    1,
    "En camino",
    [orderItem, orderItem],
    "115",
    DateTime.now(),
    DateTime.now()
  );

  List<Widget> getTestCards(BuildContext context,String category){
    List<Widget> restaurantCardTest = [
      SmallRestaurantCard(context, restaurantModel),
      SmallRestaurantCard(context, restaurantModel),
      SmallRestaurantCard(context, restaurantModel),
      SmallRestaurantCard(context, restaurantModel),
      SmallRestaurantCard(context, restaurantModel),
      SmallRestaurantCard(context, restaurantModel),
    ];
    return restaurantCardTest;
  }

  Widget getSingleCard(BuildContext context){
    return SmallRestaurantCard(context, restaurantModel);
  }

  Widget getSingleCardProduct(BuildContext context){
    return ProductCard(context, productModel);
  }

  List<Product> getTestProducts(){
    return [productModel, productModel, productModel];
  }

  Order getSingleOrder(){
    return orderModel;
  }

  List<Order> getOrders(){
    return [orderModel, orderModel2, orderModel3, orderModel4];
  }