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

  Product productModel = Product(
      "Pizza",
      "La mejor pizza de todas",
      15.0,
      "https://media.istockphoto.com/photos/fresh-homemade-pizza-margherita-picture-id1278998606?b=1&k=20&m=1278998606&s=170667a&w=0&h=BlXvVFfwLwD4ckIF_7sg_mis8ULaqy9sdPgA6grpSo4=",
      "5.0",
      "117",
      ["Tomate", "Cheese", "Pepperonni"],
      "pz."
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
