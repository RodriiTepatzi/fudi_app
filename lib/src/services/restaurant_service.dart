import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/services/product_service.dart';
import 'package:fudi_app/src/static/api_url.dart';
import 'package:http/http.dart' as http;

class RestaurantService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ProductService _productService = ProductService();
  
  /// Call this method whenever need to get all the restaurants in the database.
  /// 
  /// **Be careful** when calling this method since it can return a big list.
  /// 
  /// Instead you may want to use 
  /// ```dart
  /// getRestaurantsByCategory(String uid)
  /// ```
  /// 
  /// or
  /// 
  /// ```dart
  /// getSingleRestaurant(String uid)
  /// ```
  /// 
  /// All these methos are async.
  /// 

  Future<List<RestaurantModel>> getAllRestaurants() async{
    // We make the call to the API
    final response = await http.get(Uri.parse(apiUrl + '/restaurants/'));

    // If the response has statusCode of 200
    if(response.statusCode == 200){
      // Initialize an empty restaurant list. This could or not be filled later.
      List<RestaurantModel> restaurants = [];

      // We get the data from json. List<String>
      var tagsJson = json.decode(response.body)['\$values'];

      // We map the data to get a dynamic List from the map.
      List<dynamic> restaurantsFromJson = tagsJson.map((modelJson) => RestaurantModel.fromJson(jsonDecode(modelJson))).toList();

      // We iterate to set the models to our List of RestaurantModel
      for(int i = 0; i < restaurantsFromJson.length; i++){
        // We check if the content at this position is a RestaurantModel
        if (restaurantsFromJson[i] is RestaurantModel){
          // We check that the RestaurantModel is not null
          if(restaurantsFromJson[i] != null){
            // At this point everything is validated and can be added to list.
            restaurants.add(restaurantsFromJson[i]);
          }
        }
      }

      // To avoid errors. We prefer not to use nested json strings.
      // So we make more calls to API to get the remaining data.
      // In this case we need to call our API to get the products List.
      // So we use the _productsService to access the method to get the data.

      // We check that the list of restaurants is not neither empty nor null.
      if(restaurants.isNotEmpty && restaurants != null){
        // If not, then we iterate for every item in the list
        for (var restaurant in restaurants) {
          // We check if the restaurant.uid is not null or empty
          if(restaurant.uid != null && restaurant.uid.toString().isNotEmpty){
            // We set the products from the method in _productService using the restaurant's uid.
            restaurant.products = await _productService.getProductsFromRestaurantId(restaurant.uid.toString());
          }
        }
      }
      // Once everything is completed we return the list.
      return restaurants;
    }
    else{
      // If not then we throw and exception.
      throw Exception("Failed on getting the user data from API");
    }
  }

  Future<RestaurantModel> getRestaurantsByCategory(String uid) async{
    final response = await http.get(Uri.parse(apiUrl + '/restaurants/$uid'));
    if(response.statusCode == 200){
      return RestaurantModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed on getting the user data from API");
    }
  }

  Future<RestaurantModel> getSingleRestaurant(String uid) async{
    final response = await http.get(Uri.parse(apiUrl + '/restaurants/$uid'));
    if(response.statusCode == 200){
      return RestaurantModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed on getting the user data from API");
    }
  }

  getSingleRestaurantData(String id) async {
    await _firestore.collection("restaurants");
  }

  getMultipleRestaurants(int start, int end) async{
    await _firestore.collection("restaurants");
  }
}