import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/order_item.dart';
import 'package:fudi_app/src/models/order_product.dart';
import 'package:http/http.dart' as http;
import 'package:fudi_app/src/static/api_url.dart';
import 'dart:convert';

class CartService{
  
  Future<Cart> getCartAsync(String userId) async{
    final response = await http.get(Uri.parse("$apiUrl/users/$userId/cart"));
    if(response.statusCode == 200){
      List<Cart> carts = [];

      var tagsJson = json.decode(response.body)['\$values'];

      List<dynamic> cartsFromJson = tagsJson.map((modelJson) => Cart.fromJson(jsonDecode(modelJson))).toList();
    
      for(int i = 0; i < cartsFromJson.length; i++){
        // We check if the content at this position is a Cart
        if (cartsFromJson[i] is Cart){
          // We check that the Cart is not null
          if(cartsFromJson[i] != null){
            // At this point everything is validated and can be added to list.
            carts.add(cartsFromJson[i]);
          }
        }
      }
      return carts.isNotEmpty ? carts[0] : throw Exception("Failed on getting the user data from API");
    }
    else{
      throw Exception("Failed on getting the user data from API");
    }
  }

  void addOrderAsync(String userId, Order order) async{
    final jsonData = order.toJson();
    final jsonEncoded = json.encode(jsonData).replaceAll(r"\", "").replaceAll("\"[", "[").replaceAll("]\"", "]");
    //print(jsonEncoded);
    final response = await http.post(Uri.parse("$apiUrl/users/$userId/cart/addorder"),
    headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncoded,
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      
    }
    else{
      throw Exception("Failed on adding a new order to cart.");
    }
  }

  void addItemToOrderAsync(String userId, String restaurantId, OrderProduct orderProduct) async{
    final jsonData = orderProduct.toJson();
    final jsonEncoded = json.encode(jsonData).replaceAll(r"\", "").replaceAll("\"[", "[").replaceAll("]\"", "]");
    final response = await http.post(Uri.parse("$apiUrl/users/$userId/cart/$restaurantId/order/add-item"),
    headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncoded,
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      
    }
    else{
      throw Exception("Failed on adding a new item to cart.");
    }
  }

  void updateItemQuantity(String userId, String restaurantId, OrderProduct orderProduct) async{
    final jsonData = orderProduct.toJson();
    final jsonEncoded = json.encode(jsonData).replaceAll(r"\", "").replaceAll("\"[", "[").replaceAll("]\"", "]");
    final response = await http.put(Uri.parse("$apiUrl/users/$userId/cart/$restaurantId/order/add-quantity"),
    headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncoded,
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      
    }
    else{
      throw Exception("Failed on adding a new item to cart.");
    }
  }

  void deleteOrderAsync(String userId, String restaurantId) async{
    final response = await http.delete(Uri.parse("$apiUrl/users/$userId/cart/deleteorder/$restaurantId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      
    } 
    else {
    // If the server did not return a "200 OK response",
    throw Exception('Failed to delete order.');
    }
  }
}