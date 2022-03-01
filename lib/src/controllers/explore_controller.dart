import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/services/restaurant_service.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';

class ExploreController {
  final RestaurantService _service = RestaurantService();

  Future<List<Widget>> getRecomendations(BuildContext context) async{
    List<RestaurantModel> restaurants = await _service.getAllRestaurants();
    List<Widget> widgets = [];

    for(RestaurantModel restaurant in restaurants){
      widgets.add(SmallRestaurantCard(context, restaurant));
    }

      // add validation
    return widgets;
  }
}