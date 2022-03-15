import 'package:fudi_app/src/models/product.dart';

/// This model is the one used to represent a restaurant and its products.
/// 
/// List of [Products] should be filled separately after getting restaurant data.
/// 
class RestaurantModel {
  String uid;
  String restaurantName;
  String restaurantAddress;
  String restaurantUrl;
  String restaurantSlogan;
  int stars;
  String cost;
  String category;
  String status;
  DateTime startDate;
  List<Product>? products;


  RestaurantModel({
    required this.uid,
    required this.restaurantName, 
    required this.restaurantAddress, 
    required this.restaurantSlogan, 
    required this.restaurantUrl,
    required this.stars,
    required this.cost,
    required this.category,
    required this.status,
    required this.startDate,
    this.products, 
  });

  RestaurantModel.fromJson(Map<String, dynamic> jsonData)
    : this(
      uid : jsonData['uid'],
      restaurantName: jsonData['restaurantName'],
      restaurantAddress: jsonData['restaurantAddress'],
      restaurantSlogan: jsonData['restaurantSlogan'],
      restaurantUrl: jsonData['restaurantUrl'],
      stars: jsonData['stars'],
      cost: jsonData['cost'],
      category: jsonData['category'],
      status: jsonData['status'],
      startDate: DateTime.parse(jsonData['startDate']),
    );

  Map<String, Object?> toJson(){
    return{
      'restaurantName' : restaurantName, 
      'restaurantAddress' : restaurantAddress,
      'restaurantSlogan' : restaurantSlogan,
      'restaurantUrl': restaurantUrl,
      'stars' : stars,
      'cost' : cost,
      'category' : category,
      'status' : status,
      'startDate' : startDate,
    };
  }
}