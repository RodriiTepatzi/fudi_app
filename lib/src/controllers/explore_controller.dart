import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/restaurant_service.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';

class ExploreController {
  final RestaurantService _service = RestaurantService();

  Future<List<Widget>> getRecomendations(BuildContext context, UserApp user) async{
    List<RestaurantModel> restaurants = await _service.getAllRestaurants();
    List<Widget> widgets = [];

    for(RestaurantModel restaurant in restaurants){
      widgets.add(SmallRestaurantCard(context, restaurant, user));
    }

      // add validation
    return widgets;
  }

  Future<List<Widget>> getCategoryRestaurants(BuildContext context, String category,UserApp user) async {
    List<RestaurantModel> restaurants = await _service.getRestaurantsByCategory(category);
    List<Widget> widgets = [];

    for(RestaurantModel restaurant in restaurants){
      widgets.add(SmallRestaurantCard(context, restaurant, user));
    }

      // add validation
    return widgets;
  }
}