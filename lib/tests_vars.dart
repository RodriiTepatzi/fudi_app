import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';

  RestaurantModel restaurantModel = RestaurantModel(restaurantName: "Restaurant test", 
    restaurantAddress: "Restaurant address test", 
    restaurantSlogan: "Restaurant slogan test", 
    restaurantUrl: "/assets/images/restaurante.png", 
    stars: "5.0", cost: "\$\$\$", category: "Here goes category"
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


  Product productModel = Product(
    "Product Test",
    10.0,
    "/assets/images/food.png",
    "5.0",
    "10",
    ["Ingrediente 1", "Ingrediente 2", "Ingrediente 3"],
    "pz"

  );

  List<Product> getTestProducts(){
    return [productModel, productModel, productModel];
  }
